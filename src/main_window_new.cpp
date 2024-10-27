#include "main_window_new.h"

#include <QDebug>

MainWindowNew::MainWindowNew(QObject *parent)
    : QObject{parent}
    , m_configManager(std::make_shared<ConfigManager>(this))
    , m_configListModel(std::make_shared<ConfigListModel>(m_configManager))
    , m_proxyManager(std::make_unique<ProxyManager>(this))
{
    connect(m_configManager.get(), &ConfigManager::configChanged, this,
            &MainWindowNew::changeSelectedConfig);
    changeSelectedConfig();

    connect(m_proxyManager.get(), &ProxyManager::proxyProcessStateChanged,
            this, &MainWindowNew::runningStateChanged);
    connect(m_proxyManager.get(), &ProxyManager::proxyProcessReadyReadStandardError,
            this, &MainWindowNew::displayProxyOutput);
}

ConfigListModel* MainWindowNew::configListModel() const
{
    return m_configListModel.get();
}

void MainWindowNew::startProxy()
{
    m_proxyManager->startProxy();
}

void MainWindowNew::stopProxy()
{
    m_proxyManager->stopProxy();
}

bool MainWindowNew::runnigState() const
{
    return m_proxyManager->proxyProcessState() == QProcess::Running;
}

void MainWindowNew::changeSelectedConfig()
{
    m_proxyManager->setConfigFilePath(m_configManager->configFilePath());
    if (runnigState())
    {
        stopProxy();
        startProxy();
    }
}

void MainWindowNew::displayProxyOutput()
{
    QByteArray outputData = m_proxyManager->readProxyProcessAllStandardError();
    QString outputText = QString::fromUtf8(outputData);
    qDebug() << outputText;
}
