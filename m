Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8FD6FF78
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Aug 2016 12:05:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208,217";a="9492161"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Aug 2016 20:04:51 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1854342CA541;
	Wed,  3 Aug 2016 20:04:49 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Wed, 3 Aug 2016 20:04:48 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] cronie: 1.5.0 -> 1.5.1
Thread-Index: AQHR7Ja8QghfO4kVZUCNL5rHTHzhKaA3IJag
Date: Wed, 3 Aug 2016 12:04:48 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C6D50E17@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1470148001-61634-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAJTo0Lb87euCxRhLR+LgqB2YUsfZoTsmdkD+4tCRmUzA0BxrBw@mail.gmail.com>
In-Reply-To: <CAJTo0Lb87euCxRhLR+LgqB2YUsfZoTsmdkD+4tCRmUzA0BxrBw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.27]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 1854342CA541.A718E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: =?UTF-8?B?562U5aSNOiBbUEFUQ0hdIGNyb25pZTogMS41LjAgLT4gMS41LjE=?=
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
X-List-Received-Date: Wed, 03 Aug 2016 12:05:14 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLiBJIGFwb2xvZ2l6ZSBmb3IgdGhl
IGNvbmZ1c2lvbi4gSXQgd2FzIGFscmVhZHkgcG9zdGVkIGxhc3Qgd2Vlaywg
SSB3aWxsIG5vdCB1cGdyYWRlIGl0Lg0KDQpSZWdhcmRzLA0KSHVhbmcgUWl5
dQ0KDQoNCuWPkeS7tuS6ujogQnVydG9uLCBSb3NzIFttYWlsdG86cm9zcy5i
dXJ0b25AaW50ZWwuY29tXQ0K5Y+R6YCB5pe26Ze0OiAyMDE25bm0OOaciDLm
l6UgMTY6MjANCuaUtuS7tuS6ujogT3BlbkVtYmVkZGVkIERldmVsIExpc3Qg
PG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K
5oqE6YCBOiBIdWFuZywgUWl5dS/pu4Qg55Cm5a6HIDxodWFuZ3F5LmZuc3RA
Y24uZnVqaXRzdS5jb20+DQrkuLvpopg6IFJlOiBbb2VdIFtQQVRDSF0gY3Jv
bmllOiAxLjUuMCAtPiAxLjUuMQ0KDQoNCk9uIDIgQXVndXN0IDIwMTYgYXQg
MTU6MjYsIEh1YW5nIFFpeXUgPGh1YW5ncXkuZm5zdEBjbi5mdWppdHN1LmNv
bTxtYWlsdG86aHVhbmdxeS5mbnN0QGNuLmZ1aml0c3UuY29tPj4gd3JvdGU6
DQpVcGRhdGUgY3JvbmllIGZyb20gMS41LjAgdG8gMS41LjENCg0KVGhpcyBz
aG91bGQgYmUgb24gdGhlIG9wZW5lbWJlZGRlZC1jb3JlIGxpc3QsIHdhcyBh
bHJlYWR5IHBvc3RlZCBsYXN0IHdlZWssIGFuZCB5b3UgbWFkZSB0aGUgc2Ft
ZSBtaXN0YWtlIHRoYXQgdGhlIHByZXZpb3VzIHBhdGNoIGRpZCBieSBub3Qg
dGVzdGluZyB0aGUgUEFNLXNwZWNpZmljIHBhdGNoZXMgKHdoaWNoIGZhaWwg
dG8gYXBwbHkpLg0KDQpSb3NzDQoKCg==

