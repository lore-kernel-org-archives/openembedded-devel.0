Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id 624BE60557
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 13:35:09 +0000 (UTC)
Received: from localhost (81.232.163.241) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.279.1; Wed, 29 Oct 2014
	14:35:06 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Oct 2014 14:34:28 +0100
Message-ID: <cover.1414589640.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH 0/1] Correct file extension of breakpad generated symbol file
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
X-List-Received-Date: Wed, 29 Oct 2014 13:35:17 -0000
Content-Type: text/plain

It was reported that the generated symbol file had a wrong file extension.

The following changes since commit 374029acf30a3d81540482d348941e96cbd7999c:

  efl, elementary, e-wm: upgrade to 1.11.4 and 0.19.1 (2014-10-27 12:50:01 +0100)

are available in the git repository at:

  git://github.com/darander/meta-openembedded b04cda902acec696949a585033404d1c6ef1ed50
  https://github.com/darander/meta-openembedded/tree/breakpad-sym

Anders Darander (1):
  breakpad: correct the file suffix of the symbol file

 meta-oe/classes/breakpad.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.1


