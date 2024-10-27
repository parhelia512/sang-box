#include "main_window_new.h"

MainWindowNew::MainWindowNew(QObject *parent)
    : QObject{parent}
    , m_configManager(std::make_shared<ConfigManager>(this))
    , m_configListModel(std::make_shared<ConfigListModel>(m_configManager))
    , m_proxyManager(std::make_unique<ProxyManager>(this))
{}

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
