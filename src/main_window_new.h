#ifndef MAIN_WINDOW_NEW_H
#define MAIN_WINDOW_NEW_H

#include <QObject>
#include <QProcess>

#include <memory>

#include "config_manager.h"
#include "proxy_manager.h"
#include "config_list_model.h"

class MainWindowNew : public QObject
{
    Q_OBJECT
    Q_PROPERTY(ConfigListModel* configListModel READ configListModel NOTIFY configListModelChanged)
    Q_PROPERTY(bool runnigState READ runnigState NOTIFY runningStateChanged)
    Q_PROPERTY(QString proxyOutput READ proxyOutput NOTIFY proxyOutputChanged)

    using ConfigManagerPtr = std::shared_ptr<ConfigManager>;
    using ConfigListModelPtr = std::shared_ptr<ConfigListModel>;
    using ProxyManagerUPtr = std::unique_ptr<ProxyManager>;

public:
    explicit MainWindowNew(QObject *parent = nullptr);

    ConfigListModel* configListModel() const;

public slots:
    void startProxy();
    void stopProxy();

signals:
    void configListModelChanged();
    void runningStateChanged();
    void proxyOutputChanged();

private:
    bool runnigState() const;
    QString proxyOutput() const;

private slots:
    void changeSelectedConfig();
    void updateProxyOutput();

private:
    ConfigManagerPtr m_configManager;
    ConfigListModelPtr m_configListModel;
    ProxyManagerUPtr m_proxyManager;
    QString m_proxyOutput;
};

#endif // MAIN_WINDOW_NEW_H
