Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id ED2F078411
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 08:54:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208,217";a="35109325"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jan 2018 16:54:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D8E50480D736;
	Wed, 10 Jan 2018 16:53:59 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0361.001; Wed, 10 Jan 2018 16:53:57 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [oe] [meta-oe][PATCH]nautilus: new add
Thread-Index: AQHTiVGlaqFVh7oXE06DI4gHyL5bNKNszfiA
Date: Wed, 10 Jan 2018 08:54:01 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7363A95AA9@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1515126019-117327-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0Lbjb7+jRncoxL7ui90hh+ZDJkFKyPELyczN+_8i=t-yhg@mail.gmail.com>
In-Reply-To: <CAJTo0Lbjb7+jRncoxL7ui90hh+ZDJkFKyPELyczN+_8i=t-yhg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.153]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: D8E50480D736.A90DF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH]nautilus: new add
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
X-List-Received-Date: Wed, 10 Jan 2018 08:54:04 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zczoNCiAgICAgICAgICBXaGljaCBjbGFzcyBoYW5kbGUg4oCcLS1k
aXNhYmxlLW5sc+KAnT8NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClpoZW5nIFJ1b3Fpbg0KTmFuamlu
ZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNU
KQ0KQUREUi46IE5vLjYgV2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwN
CiAgICAgICBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpNQUlMIDogemhlbmdy
cS5mbnN0QGNuLmZ1amlzdHUuY29tDQoNCkZyb206IEJ1cnRvbiwgUm9zcyBb
bWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNvbV0NClNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgMDksIDIwMTggOTo1NiBQTQ0KVG86IFpoZW5nLCBSdW9xaW4v
6YORIOiLpemSpiA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KQ2M6
IE9wZW5FbWJlZGRlZCBEZXZlbCBMaXN0IDxvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbb2VdIFtt
ZXRhLW9lXVtQQVRDSF1uYXV0aWx1czogbmV3IGFkZA0KDQpPbiA1IEphbnVh
cnkgMjAxOCBhdCAwNDoyMCwgemhlbmdycSA8emhlbmdycS5mbnN0QGNuLmZ1
aml0c3UuY29tPG1haWx0bzp6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+
PiB3cm90ZToNCitFWFRSQV9PRUNPTkYgPSAiIC0tZGlzYWJsZS1ndGstZG9j
DQoNClRoZXJlJ3MgYSBjbGFzcyB0byBoYW5kbGUgdGhpcy4NCg0KLS1kaXNh
YmxlLW5scw0KDQpXaHkgYXJlIHlvdSBkaXNhYmxpbmcgaTE4bj8NCg0KLS1l
bmFibGUtaW50cm9zcGVjdGlvbj1ubyINCg0KVGhlcmUncyBhIGNsYXNzIHRv
IGhhbmRsZSB0aGlzLg0KDQpSb3NzDQoKCg==

