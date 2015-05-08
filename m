Return-Path: <igor.santos@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id B051760034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 18:06:40 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Fri, 8 May 2015 15:06:39 -0300
	(envelope-from igor.santos@aker.com.br)
Received: from igor.santos.devel.com.br (10.4.59.1) by mail.aker.com.br
	(10.0.0.20) with Microsoft SMTP Server id 8.3.342.0;
	Fri, 8 May 2015 15:06:37 -0300
From: Igor Santos <igor.santos@aker.com.br>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 May 2015 15:06:06 -0300
Message-ID: <1431108368-20646-1-git-send-email-igor.santos@aker.com.br>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: a5fc2d2b506f49fc2bd6d1c7ad2f56ee346d5d27
X-AkerSMTPGW-MessageID: d0de5b77e3fa2ce33a770c42d6536e605bacec22-15o
Subject: [meta-oe][PATCH 0/2] Add ctags and cscope
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
X-List-Received-Date: Fri, 08 May 2015 18:06:43 -0000
Content-Type: text/plain

Hi, these series add ctags and cscope to the devtools.
It's interesting to add these tools to the stable branches.

Igor Santos (2):
  ctags: add
  cscope: add

 meta-oe/recipes-devtools/cscope/cscope_15.8b.bb | 24 ++++++++++++++++++++++++
 meta-oe/recipes-devtools/ctags/ctags_5.8.bb     | 25 +++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cscope/cscope_15.8b.bb
 create mode 100644 meta-oe/recipes-devtools/ctags/ctags_5.8.bb

-- 
2.1.0



