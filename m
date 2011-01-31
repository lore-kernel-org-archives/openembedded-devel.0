Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1PjznH-0005VK-B1
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 20:52:11 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id EBEB5EB331
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 20:51:17 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ahw4AHOhRk1T4zjzPGdsb2JhbACIXpwaDAEBAQE1L716hU4EjCE
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="170533003"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 31 Jan 2011 20:51:17 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 20:51:01 +0100
Message-Id: <1296503466-3877-3-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1296503466-3877-2-git-send-email-ulf.samuelsson@atmel.com>
References: <1296503466-3877-1-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-2-git-send-email-ulf.samuelsson@atmel.com>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 3/8] Add initial pointercal files for at91 boards
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
X-List-Received-Date: Mon, 31 Jan 2011 19:52:11 -0000

---
 recipes/pointercal/files/at91sam9261ek/pointercal  |    1 +
 recipes/pointercal/files/at91sam9263ek/pointercal  |    1 +
 recipes/pointercal/files/at91sam9g10ek/pointercal  |    1 +
 .../pointercal/files/at91sam9g45ekes/pointercal    |    1 +
 .../pointercal/files/at91sam9m10ekes/pointercal    |    1 +
 .../pointercal/files/at91sam9m10g45ek/pointercal   |    1 +
 recipes/pointercal/files/at91sam9rlek/pointercal   |    1 +
 7 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 recipes/pointercal/files/at91sam9261ek/pointercal
 create mode 100644 recipes/pointercal/files/at91sam9263ek/pointercal
 create mode 100644 recipes/pointercal/files/at91sam9g10ek/pointercal
 create mode 100644 recipes/pointercal/files/at91sam9g45ekes/pointercal
 create mode 100644 recipes/pointercal/files/at91sam9m10ekes/pointercal
 create mode 100644 recipes/pointercal/files/at91sam9m10g45ek/pointercal
 create mode 100644 recipes/pointercal/files/at91sam9rlek/pointercal

diff --git a/recipes/pointercal/files/at91sam9261ek/pointercal b/recipes/pointercal/files/at91sam9261ek/pointercal
new file mode 100644
index 0000000..8ad165c
--- /dev/null
+++ b/recipes/pointercal/files/at91sam9261ek/pointercal
@@ -0,0 +1 @@
+-63 4252 -705920 5593 13 -1131758 65536
diff --git a/recipes/pointercal/files/at91sam9263ek/pointercal b/recipes/pointercal/files/at91sam9263ek/pointercal
new file mode 100644
index 0000000..7a8596d
--- /dev/null
+++ b/recipes/pointercal/files/at91sam9263ek/pointercal
@@ -0,0 +1 @@
+-10 4298 -1026530 5663 8 -1123190 65536
diff --git a/recipes/pointercal/files/at91sam9g10ek/pointercal b/recipes/pointercal/files/at91sam9g10ek/pointercal
new file mode 100644
index 0000000..709bf6a
--- /dev/null
+++ b/recipes/pointercal/files/at91sam9g10ek/pointercal
@@ -0,0 +1 @@
+62 4355 -1186130 5776 15 -1289552 65536
diff --git a/recipes/pointercal/files/at91sam9g45ekes/pointercal b/recipes/pointercal/files/at91sam9g45ekes/pointercal
new file mode 100644
index 0000000..d8b5fd6
--- /dev/null
+++ b/recipes/pointercal/files/at91sam9g45ekes/pointercal
@@ -0,0 +1 @@
+33442 123 -1524636 -99 21242 -1963236 65536
diff --git a/recipes/pointercal/files/at91sam9m10ekes/pointercal b/recipes/pointercal/files/at91sam9m10ekes/pointercal
new file mode 100644
index 0000000..d8b5fd6
--- /dev/null
+++ b/recipes/pointercal/files/at91sam9m10ekes/pointercal
@@ -0,0 +1 @@
+33442 123 -1524636 -99 21242 -1963236 65536
diff --git a/recipes/pointercal/files/at91sam9m10g45ek/pointercal b/recipes/pointercal/files/at91sam9m10g45ek/pointercal
new file mode 100644
index 0000000..3623751
--- /dev/null
+++ b/recipes/pointercal/files/at91sam9m10g45ek/pointercal
@@ -0,0 +1 @@
+33229 -46 -1353468 168 20496 -1811604 65536
diff --git a/recipes/pointercal/files/at91sam9rlek/pointercal b/recipes/pointercal/files/at91sam9rlek/pointercal
new file mode 100644
index 0000000..6020d7f
--- /dev/null
+++ b/recipes/pointercal/files/at91sam9rlek/pointercal
@@ -0,0 +1 @@
+16853 73 -772255 -134 -22464 22132488 65536
-- 
1.6.3.3



