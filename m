Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB9F71353
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 07:54:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56320479"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2015 15:50:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0K7raKi007828
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:53:36 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 20 Jan 2015 15:54:18 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Jan 2015 15:53:36 +0800
Message-ID: <1421740416-2479-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-networking][PATCH] radvd: add licenses file to fix warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Jan 2015 07:54:23 -0000
Content-Type: text/plain

WARNING: radvd: No generic license file exists for: radvd in any provider

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-networking/licenses/radvd | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-networking/licenses/radvd

diff --git a/meta-networking/licenses/radvd b/meta-networking/licenses/radvd
new file mode 100644
index 0000000..03db0b6
--- /dev/null
+++ b/meta-networking/licenses/radvd
@@ -0,0 +1,37 @@
+The author(s) grant permission for redistribution and use in source and
+binary forms, with or without modification, of the software and documentation
+provided that the following conditions are met:
+
+0. If you receive a version of the software that is specifically labelled
+   as not being for redistribution (check the version message and/or README),
+   you are not permitted to redistribute that version of the software in any
+   way or form.
+1. All terms of all other applicable copyrights and licenses must be
+   followed.
+2. Redistributions of source code must retain the authors' copyright
+   notice(s), this list of conditions, and the following disclaimer.
+3. Redistributions in binary form must reproduce the authors' copyright
+   notice(s), this list of conditions, and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+4. All advertising materials mentioning features or use of this software
+   must display the following acknowledgement with the name(s) of the
+   authors as specified in the copyright notice(s) substituted where
+   indicated:
+
+        This product includes software developed by the authors which are 
+	mentioned at the start of the source files and other contributors.
+
+5. Neither the name(s) of the author(s) nor the names of its contributors
+   may be used to endorse or promote products derived from this software
+   without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY ITS AUTHORS AND CONTRIBUTORS ``AS IS'' AND ANY
+EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+DISCLAIMED. IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE FOR ANY
+DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
+ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
1.8.4.2


