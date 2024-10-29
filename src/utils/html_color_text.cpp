#include "html_color_text.h"

#include <QColor>
#include <QRegularExpression>

namespace
{
static const std::map<QString, QColor> logLevelMap
{
    { "PANIC", "#BA1A1A"  },
    { "FATAL", "#BA1A1A"  },
    { "ERROR", "#BA1A1A"  },
    { "WARN",  Qt::yellow },
    { "INFO",  Qt::cyan   },
    { "DEBUG", Qt::white  },
    { "TRACE", Qt::white  },
};
static const QString colorfulLogLevelTemplate = "<font color=\"%2\">%1</font>";
}

void HtmlColorText::appendHtmlColorText(QString &text)
{
    QRegularExpression re("(^\\w+)");
    QRegularExpressionMatch match = re.match(text);
    if (match.hasMatch())
    {
        QString logLevel = match.captured(0);
        const auto it = logLevelMap.find(logLevel);
        if (it != logLevelMap.end())
        {
            const QString logColor = it->second.name();
            const QString colorfulLogLevel = colorfulLogLevelTemplate.arg(logLevel, logColor);
            const auto endPos = logLevel.length();
            text.replace(0, endPos, colorfulLogLevel);
        }
    }
}
