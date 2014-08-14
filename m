Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51AE960144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:17:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7E9Hld5015905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Aug 2014 02:17:47 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 14 Aug 2014 02:17:46 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Thu, 14 Aug 2014 17:13:29 +0800
Message-ID: <1408007615-23880-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/6][meta-perl] V2 - Add some perl modules
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
X-List-Received-Date: Thu, 14 Aug 2014 09:17:47 -0000
Content-Type: text/plain

V2:
* Re-indent with 4 spaces


Kai Kang (6):
  libdigest-sha1-perl: add recipe
  libdigest-hmac-perl: add recipe
  libauthen-sasl-perl: add recipe
  libnet-ssleay-perl: add recipe
  libio-socket-ssl-perl: add recipe
  libmime-types-perl: add recipe

 meta-perl/recipes-perl/libauthen/files/run-ptest   | 16 ++++++++
 .../libauthen/libauthen-sasl-perl_2.16.bb          | 30 +++++++++++++++
 meta-perl/recipes-perl/libdigest/files/run-ptest   | 16 ++++++++
 .../libdigest/libdigest-hmac-perl_1.03.bb          | 26 +++++++++++++
 .../libdigest/libdigest-sha1-perl_2.13.bb          | 25 ++++++++++++
 meta-perl/recipes-perl/libio/files/run-ptest       | 16 ++++++++
 .../libio/libio-socket-ssl-perl_1.997.bb           | 45 ++++++++++++++++++++++
 meta-perl/recipes-perl/libmime/files/run-ptest     | 16 ++++++++
 .../libmime/libmime-types-perl_2.04.bb             | 26 +++++++++++++
 meta-perl/recipes-perl/libnet/files/run-ptest      | 16 ++++++++
 .../recipes-perl/libnet/libnet-ssleay-perl_1.65.bb | 43 +++++++++++++++++++++
 11 files changed, 275 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libauthen/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
 create mode 100644 meta-perl/recipes-perl/libdigest/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
 create mode 100644 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
 create mode 100644 meta-perl/recipes-perl/libio/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
 create mode 100644 meta-perl/recipes-perl/libmime/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libmime/libmime-types-perl_2.04.bb
 create mode 100644 meta-perl/recipes-perl/libnet/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb

-- 
1.9.1


