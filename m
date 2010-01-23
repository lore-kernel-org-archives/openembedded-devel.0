Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYclZ-0000HU-GT
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:58:59 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 450BA1B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 09:55:25 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 10:56:17 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <201001230943.24210.holger+oe@freyther.de>
In-Reply-To: <201001230943.24210.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <201001231056.17675.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patchwork Workflow improvement
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Jan 2010 09:58:59 -0000
X-Groupsio-MsgNum: 16064
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_BfsWLagHO5Dw4Na"

--Boundary-00=_BfsWLagHO5Dw4Na
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Saturday 23 January 2010 09:43:24 Holger Hans Peter Freyther wrote:
> Hi All,


I have pushed "holger/staging-branch" to the server. It does contain all 
patches from patchwork that are still applying. Please go through the branch 
and cherry-pick or follow up on the emails.. I also have a new version of the 
program I use attached... I will probably switch it to use pwclient in the 
future.

thanks

The current list of failures:
# 142 patches failed to apply.
http://patchwork.openembedded.org/patch/454
http://patchwork.openembedded.org/patch/650
http://patchwork.openembedded.org/patch/651
http://patchwork.openembedded.org/patch/691
http://patchwork.openembedded.org/patch/714
http://patchwork.openembedded.org/patch/727
http://patchwork.openembedded.org/patch/729
http://patchwork.openembedded.org/patch/740
http://patchwork.openembedded.org/patch/743
http://patchwork.openembedded.org/patch/746
http://patchwork.openembedded.org/patch/747
http://patchwork.openembedded.org/patch/750
http://patchwork.openembedded.org/patch/753
http://patchwork.openembedded.org/patch/770
http://patchwork.openembedded.org/patch/773
http://patchwork.openembedded.org/patch/881
http://patchwork.openembedded.org/patch/890
http://patchwork.openembedded.org/patch/893
http://patchwork.openembedded.org/patch/902
http://patchwork.openembedded.org/patch/940
http://patchwork.openembedded.org/patch/942
http://patchwork.openembedded.org/patch/949
http://patchwork.openembedded.org/patch/950
http://patchwork.openembedded.org/patch/959
http://patchwork.openembedded.org/patch/960
http://patchwork.openembedded.org/patch/972
http://patchwork.openembedded.org/patch/986
http://patchwork.openembedded.org/patch/988
http://patchwork.openembedded.org/patch/989
http://patchwork.openembedded.org/patch/994
http://patchwork.openembedded.org/patch/1000
http://patchwork.openembedded.org/patch/1004
http://patchwork.openembedded.org/patch/1005
http://patchwork.openembedded.org/patch/1007
http://patchwork.openembedded.org/patch/1008
http://patchwork.openembedded.org/patch/1016
http://patchwork.openembedded.org/patch/1020
http://patchwork.openembedded.org/patch/1021
http://patchwork.openembedded.org/patch/1022
http://patchwork.openembedded.org/patch/1023
http://patchwork.openembedded.org/patch/1024
http://patchwork.openembedded.org/patch/1030
http://patchwork.openembedded.org/patch/1043
http://patchwork.openembedded.org/patch/1036
http://patchwork.openembedded.org/patch/1046
http://patchwork.openembedded.org/patch/1041
http://patchwork.openembedded.org/patch/1048
http://patchwork.openembedded.org/patch/1056
http://patchwork.openembedded.org/patch/1064
http://patchwork.openembedded.org/patch/1066
http://patchwork.openembedded.org/patch/1067
http://patchwork.openembedded.org/patch/1074
http://patchwork.openembedded.org/patch/1078
http://patchwork.openembedded.org/patch/1082
http://patchwork.openembedded.org/patch/1083
http://patchwork.openembedded.org/patch/1089
http://patchwork.openembedded.org/patch/1090
http://patchwork.openembedded.org/patch/1092
http://patchwork.openembedded.org/patch/1093
http://patchwork.openembedded.org/patch/1095
http://patchwork.openembedded.org/patch/1098
http://patchwork.openembedded.org/patch/1115
http://patchwork.openembedded.org/patch/1119
http://patchwork.openembedded.org/patch/1122
http://patchwork.openembedded.org/patch/1135
http://patchwork.openembedded.org/patch/1144
http://patchwork.openembedded.org/patch/1149
http://patchwork.openembedded.org/patch/1150
http://patchwork.openembedded.org/patch/1152
http://patchwork.openembedded.org/patch/1153
http://patchwork.openembedded.org/patch/1154
http://patchwork.openembedded.org/patch/1157
http://patchwork.openembedded.org/patch/1161
http://patchwork.openembedded.org/patch/1162
http://patchwork.openembedded.org/patch/1163
http://patchwork.openembedded.org/patch/1164
http://patchwork.openembedded.org/patch/1172
http://patchwork.openembedded.org/patch/1176
http://patchwork.openembedded.org/patch/1175
http://patchwork.openembedded.org/patch/1173
http://patchwork.openembedded.org/patch/1178
http://patchwork.openembedded.org/patch/1186
http://patchwork.openembedded.org/patch/1187
http://patchwork.openembedded.org/patch/1191
http://patchwork.openembedded.org/patch/1192
http://patchwork.openembedded.org/patch/1193
http://patchwork.openembedded.org/patch/1194
http://patchwork.openembedded.org/patch/1202
http://patchwork.openembedded.org/patch/1204
http://patchwork.openembedded.org/patch/1209
http://patchwork.openembedded.org/patch/1210
http://patchwork.openembedded.org/patch/1211
http://patchwork.openembedded.org/patch/1214
http://patchwork.openembedded.org/patch/1221
http://patchwork.openembedded.org/patch/1223
http://patchwork.openembedded.org/patch/1225
http://patchwork.openembedded.org/patch/1226
http://patchwork.openembedded.org/patch/1229
http://patchwork.openembedded.org/patch/1231
http://patchwork.openembedded.org/patch/1247
http://patchwork.openembedded.org/patch/1250
http://patchwork.openembedded.org/patch/1261
http://patchwork.openembedded.org/patch/1266
http://patchwork.openembedded.org/patch/1267
http://patchwork.openembedded.org/patch/1269
http://patchwork.openembedded.org/patch/1283
http://patchwork.openembedded.org/patch/1284
http://patchwork.openembedded.org/patch/1286
http://patchwork.openembedded.org/patch/1289
http://patchwork.openembedded.org/patch/1303
http://patchwork.openembedded.org/patch/1314
http://patchwork.openembedded.org/patch/1317
http://patchwork.openembedded.org/patch/1316
http://patchwork.openembedded.org/patch/1320
http://patchwork.openembedded.org/patch/1322
http://patchwork.openembedded.org/patch/1326
http://patchwork.openembedded.org/patch/1327
http://patchwork.openembedded.org/patch/1334
http://patchwork.openembedded.org/patch/1352
http://patchwork.openembedded.org/patch/1354
http://patchwork.openembedded.org/patch/1351
http://patchwork.openembedded.org/patch/1366
http://patchwork.openembedded.org/patch/1379
http://patchwork.openembedded.org/patch/1382
http://patchwork.openembedded.org/patch/1393
http://patchwork.openembedded.org/patch/1402
http://patchwork.openembedded.org/patch/1418
http://patchwork.openembedded.org/patch/1431
http://patchwork.openembedded.org/patch/1438
http://patchwork.openembedded.org/patch/1439
http://patchwork.openembedded.org/patch/1440
http://patchwork.openembedded.org/patch/1453
http://patchwork.openembedded.org/patch/1454
http://patchwork.openembedded.org/patch/1455
http://patchwork.openembedded.org/patch/1456
http://patchwork.openembedded.org/patch/1457
http://patchwork.openembedded.org/patch/1452
http://patchwork.openembedded.org/patch/1467
http://patchwork.openembedded.org/patch/1468
http://patchwork.openembedded.org/patch/1489
http://patchwork.openembedded.org/patch/1504
http://patchwork.openembedded.org/patch/1505

--Boundary-00=_BfsWLagHO5Dw4Na
Content-Type: text/x-c++src;
  charset="UTF-8";
  name="main.cc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="main.cc"

/*
 * Copyright (C) 2010 Holger Hans Peter Freyther
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE COMPUTER, INC. ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE COMPUTER, INC. OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <QApplication>
#include <QWebFrame>
#include <QWebElement>
#include <QWebPage>

class Worker : public QObject {
    Q_OBJECT
public:
    Worker()
        : m_currentPage(1)
    {
        m_page = new QWebPage(this);
        connect(m_page, SIGNAL(loadFinished(bool)), SLOT(loadFinished(bool)));
    }

    void start()
    {
        qWarning("Trying to download page %d from patchwork", m_currentPage);
        QUrl url("http://patchwork.openembedded.org/project/openembedded/list/?order=date&page=" + QByteArray::number(m_currentPage));
        m_page->mainFrame()->load(url);
    }

    void startNext()
    {
        ++m_currentPage;
        start();
    }

    // Use git apply first and then use git am...
    void applyPatch(int patch_no)
    {
        QByteArray apply_cmd = "cd /home/ich/source/embedded/openembedded/; ";
        apply_cmd +=  "wget -o /dev/null -O /dev/stdout http://patchwork.openembedded.org/patch/" + QByteArray::number(patch_no) + "/mbox/";
        apply_cmd += " | git apply --check > /dev/null 2>&1";
        int result = system(apply_cmd.constData());
        if (result == 0) {
            QByteArray am_cmd = "cd /home/ich/source/embedded/openembedded/; ";
            am_cmd +=  "wget -o /dev/null -O /dev/stdout http://patchwork.openembedded.org/patch/" + QByteArray::number(patch_no) + "/mbox/";
            am_cmd += " | git am > /dev/null 2>&1";
            result = system(am_cmd.constData());
        }

        if (result != 0)
            m_failingPatches.append("http://patchwork.openembedded.org/patch/" + QByteArray::number(patch_no));
    }

    void handleCurrentPatch(QWebElement patch)
    {
        QWebElement link = patch.findFirst("a");
        QList<QWebElement> table = patch.findAll("td").toList();
        QString date, author, state;

        if (table.size() == 5) {
            date = table[1].toPlainText();
            author = table[2].toPlainText();
            state = table[4].toPlainText();
        }

        QString href = link.attribute("href");
        if (href.isEmpty() || !href.startsWith("/patch/")) {
            qWarning("Can not parse href from the link..");
            return;
        }

        // strip the '/patch/' and the last '/' from the url
        int patch_no = href.mid(sizeof "/patch/" - 1, href.length() - sizeof "/patch/").toInt();
        if (patch_no <= 0) {
            qWarning("Failed to find the patch number.");
            return;
        }

        qWarning("\tDate: %s Author: '%s' State: %s '%s'", qPrintable(date), qPrintable(author), qPrintable(state), qPrintable(link.toPlainText()));
        applyPatch(patch_no);

    }

    // query for all patches..
    void handleCurrentPage()
    {
        QWebElementCollection patches = m_page->mainFrame()->findAllElements("tr[id*=patch_row]");
        foreach(QWebElement element, patches)
            handleCurrentPatch(element);
    }

public Q_SLOTS:
    void loadFinished(bool result)
    {
        // Verify that we got the page we wanted
        QWebElement currentPage = m_page->mainFrame()->findFirstElement("span[title='Current Page']");
        if (currentPage.isNull()) {
            qWarning("Failed to find the current page.");
            return QApplication::exit(-1);
        }
        int currentPageNo = currentPage.toPlainText().toInt();
        if (currentPageNo != m_currentPage) {
            qWarning("The end was reached.");
            return QApplication::exit(0);
        }

        qWarning("Finished the download of page %d with status: %d", m_currentPage, result);
        handleCurrentPage();

        startNext();
    }

public:
    QWebPage* m_page;
    int m_currentPage;
    QList<QString> m_failingPatches;
};

int main(int argc, char **argv)
{
    QApplication app(argc, argv);

    Worker worker;
    worker.start();
    app.exec();

    if (worker.m_failingPatches.isEmpty())
        return 0;

    qWarning("# %d patches failed to apply.", worker.m_failingPatches.size());
    foreach(QString url, worker.m_failingPatches)
        qWarning("%s", qPrintable(url));
}

#include "main.moc"

--Boundary-00=_BfsWLagHO5Dw4Na--
