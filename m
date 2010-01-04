Received: from [210.83.210.153] (helo=mailgate1.neusoft.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <liu-dj@neusoft.com>) id 1NRcOt-00063k-UJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 03:10:35 +0100
X-IronPort-AV: E=McAfee;i="5400,1158,5850"; a="41504595"
Received: from unknown (HELO mailgate8.neusoft.com) ([10.0.5.18])
	by mailgate1.neusoft.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	04 Jan 2010 10:04:14 +0800
Received: from unknown (HELO smtp3.neusoft.com) ([210.83.210.139])
	by mailgate8.neusoft.com with ESMTP; 04 Jan 2010 10:07:20 +0800
Received: from [10.1.10.188] ([10.1.10.188])
	by smtp3.neusoft.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul
	14 2004)) with ESMTPPSA id <0KVP003XO9XOH7@smtp3.neusoft.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	04 Jan 2010 10:08:12 +0800 (CST)
Date: Sun, 03 Jan 2010 23:08:11 -0300
From: "Dejun.Liu" <liu-dj@neusoft.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <1262570891.5811.14.camel@dejunliu-desktop>
MIME-version: 1.0
X-Mailer: Evolution 2.22.2
X-SA-Exim-Connect-IP: 210.83.210.153
X-SA-Exim-Mail-From: liu-dj@neusoft.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: help on angstrom qemu
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
X-List-Received-Date: Mon, 04 Jan 2010 02:10:35 -0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"

77u/SGksCgpkb2VzIGFueW9uZSBrbm93IGhvdyB0byBidWlsZCBhbmdzdHJvbShRZW11IHZlcnNp
b24pIGFuZCBydW4gaXQgb24gUWVtdS4KCmkgZm9sbG93IHRoZSBpbnN0cnVjdGlvbiBwcm92aWRl
ZCBieSAKaHR0cDovL3d3dy5hbmdzdHJvbS1kaXN0cmlidXRpb24ub3JnL2J1aWxkaW5nLWFuZ3N0
cm9tCmh0dHA6Ly93d3cubGludXh0b2dvLm9yZy9nb3dpa2kvQW5nc3Ryb20vcWVtdS1zeXN0ZW0t
YXJtIAoKQnV0IGkgZmFpbGVkIHdoZW4gaSBzdGFydCBRZW11IHdpdGg6CnFlbXUtc3lzdGVtLWFy
bSAtTSB2ZXJzYXRpbGVwYiAtdXNiIC11c2JkZXZpY2Ugd2Fjb20tdGFibGV0IC1zaG93LWN1cnNv
cgotbSA2NAota2VybmVsIC9ob21lL3Byb3RvY29sL3N0dWR5L09FL2FuZ3N0cm9tLWRldi9kZXBs
b3kvZ2xpYmMvaW1hZ2VzL3FlbXVhcm0vekltYWdlLTIuNi4yNSsyLjYuMjYtcmM0LXI2LXFlbXVh
cm0uYmluIC1kcml2ZSBmaWxlPS9ob21lL3Byb3RvY29sL3N0dWR5L09FL2FuZ3N0cm9tLWRldi9k
ZXBsb3kvZ2xpYmMvaW1hZ2VzL3FlbXVhcm0vQW5nc3Ryb20teDExLWltYWdlLWdsaWJjLWlway0y
MDA5Llgtc3RhYmxlLXFlbXVhcm0ucm9vdGZzLmV4dDMgLWFwcGVuZCAicm9vdD0vZGV2L3NkYSIK
CmFuZCB0aGUgZXJyb3IgaXMgc2hvd24gYmVsb3c6Cu+7vz4gQ291bGQgbm90IGluaXRpYWxpemUg
U0RMIC0gZXhpdGluZwo+IFNETCBlcnJvcjogTm8gYXZhaWxhYmxlIHZpZGVvIGRldmljZQoKYW5k
IGkgaGF2YSBmb3VuZCB0aGF0IE9FIHByb3ZpZGVkIGxpYlNETCBkb2VzIG5vdCBzdXBwb3J0ZWQg
WDExLgoKClNvIGFueW9uZSBjYW4gaGVscCBtZSA/CmhvdyBzaG91bGQgIGJ1aWxkIGEgUWVtdSB2
ZXJzaW9uIE9FICxhbmQgcnVuIGl0IGluIFFlbXU/CgpDaGVlcnMKClN0ZXZlbiBMaXUKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDb25maWRlbnRpYWxpdHkgTm90
aWNlOiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIGFuZCBhbnkgYWNj
b21wYW55aW5nIGF0dGFjaG1lbnQocykgCmlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSB1c2Ugb2Yg
dGhlIGludGVuZGVkIHJlY2lwaWVudCBhbmQgbWF5IGJlIGNvbmZpZGVudGlhbCBhbmQvb3IgcHJp
dmlsZWdlZCBvZiAKTmV1c29mdCBDb3Jwb3JhdGlvbiwgaXRzIHN1YnNpZGlhcmllcyBhbmQvb3Ig
aXRzIGFmZmlsaWF0ZXMuIElmIGFueSByZWFkZXIgb2YgdGhpcyBjb21tdW5pY2F0aW9uIGlzIApu
b3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgdW5hdXRob3JpemVkIHVzZSwgZm9yd2FyZGluZywg
cHJpbnRpbmcsICBzdG9yaW5nLCBkaXNjbG9zdXJlIG9yIGNvcHlpbmcgCmlzIHN0cmljdGx5IHBy
b2hpYml0ZWQsIGFuZCBtYXkgYmUgdW5sYXdmdWwuSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBj
b21tdW5pY2F0aW9uIGluIGVycm9yLHBsZWFzZSAKaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5k
ZXIgYnkgcmV0dXJuIGUtbWFpbCwgYW5kIGRlbGV0ZSB0aGUgb3JpZ2luYWwgbWVzc2FnZSBhbmQg
YWxsIGNvcGllcyBmcm9tIAp5b3VyIHN5c3RlbS4gVGhhbmsgeW91LiAKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCg==



