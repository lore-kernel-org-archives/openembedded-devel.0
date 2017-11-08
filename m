Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D144071DDD
	for <openembedded-devel@openembedded.org>;
	Wed,  8 Nov 2017 01:35:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA81Z6V5016664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Nov 2017 17:35:07 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.97]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Tue, 7 Nov 2017 17:35:06 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Thread-Topic: samba 4.7.0
Thread-Index: AdNYMXj62H7qkvXlTQCvhvc01zXS9Q==
Date: Wed, 8 Nov 2017 01:35:05 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF44F008@ALA-MBC.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.118.78]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: samba 4.7.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Nov 2017 01:35:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I would like to move us to 4.7.0 which requires updating libtalloc, libteve=
nt, libtdb and libldb.  Updating the last breaks the build for samba 4.6.7.=
  If this is where we would like to go, please hold off on patches for thes=
e recipes or send them to me for inclusion in my submissions.

Joe


