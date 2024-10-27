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
    void proxyChanged(bool enabled);
    void configListModelChanged();

private:
    ConfigManagerPtr m_configManager;
    ConfigListModelPtr m_configListModel;
    ProxyManagerUPtr m_proxyManager;
};

#endif // MAIN_WINDOW_NEW_H
