Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <acassis@gmail.com>) id 1LNAYq-0003Hd-A6
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 19:33:52 +0100
Received: by an-out-0708.google.com with SMTP id d40so371266and.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2009 10:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=gwnEdlkOPW8i3rzcV9Chx/SHL+iz1rrf+cwTcmTFbeM=;
	b=t2Qvhsr29ZvO1xwOA8hYfNrs4RL6UoTyxB6hrTUAyzQhM26JU5/Ms1iT3RO0b7AEKF
	RRCpf1XK5QqtxqhIaP+os/3mFPjK+18hY/bJBhKNcYnEhYyQppLQBGHIUMZbbJUrOcdu
	WRcqm68VjOCocigfNpbrJX3CYlaDbRBkPXpy4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=hHGzt+gUPH2wH9s8etMMVgqE9etMqU34Q/rMqGUwIfvAHyXnY1mckqnFgJtK1F3cf1
	31Jk5nqK2U/4n4/tkc2SyX4TKp+G3cJaTzwBMgYWi3KtCKCQoenn5JHbyRtNs267yUAk
	pvUO5u4O2vAaIcyiR8RSnBHSKoRIw68jKScnw=
Received: by 10.142.217.17 with SMTP id p17mr112698wfg.275.1231957635739;
	Wed, 14 Jan 2009 10:27:15 -0800 (PST)
Received: by 10.142.127.18 with HTTP; Wed, 14 Jan 2009 10:27:15 -0800 (PST)
Message-ID: <37367b3a0901141027h63846cc7u3deeba213f7e15a1@mail.gmail.com>
Date: Wed, 14 Jan 2009 18:27:15 +0000
From: "Alan Carvalho de Assis" <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] add imx27ads board
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
X-List-Received-Date: Wed, 14 Jan 2009 18:33:52 -0000
X-Groupsio-MsgNum: 7236
Content-Type: multipart/mixed; 
	boundary="----=_Part_270086_29876510.1231957635733"

------=_Part_270086_29876510.1231957635733
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am sending attached the cfg file to initialize the iMX27ADS board.

I hope this time I don't need to edit any makefile in order to copy my
cfg to right place :-)

Best Regards,

Alan

------=_Part_270086_29876510.1231957635733
Content-Type: application/mbox; name=addimx27ads.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fpy7cdth0
Content-Disposition: attachment; filename=addimx27ads.patch

ZGlmZiAtTmF1ciBvcGVub2NkX29yaWcvc3JjL3RhcmdldC9ib2FyZC9pbXgyN2Fkcy5jZmcgb3Bl
bm9jZC9zcmMvdGFyZ2V0L2JvYXJkL2lteDI3YWRzLmNmZwotLS0gb3Blbm9jZF9vcmlnL3NyYy90
YXJnZXQvYm9hcmQvaW14MjdhZHMuY2ZnCTE5NzAtMDEtMDEgMDA6MDA6MDAuMDAwMDAwMDAwICsw
MDAwCisrKyBvcGVub2NkL3NyYy90YXJnZXQvYm9hcmQvaW14MjdhZHMuY2ZnCTIwMDktMDEtMTQg
MTY6MDU6MDUuMDAwMDAwMDAwICswMDAwCkBAIC0wLDAgKzEsNzUgQEAKKyMgVGhlIElNWDI3IEFE
UyBldmFsIGJvYXJkIGhhcyBhIHNpbmdsZSBJTVgyNyBjaGlwCisjIE5vdGU6IHRlc3RlZCBvbiBJ
TVgyN0FEUyBCb2FyZCBSRVYtMi42IGFuZCBSRVYtMi44Citzb3VyY2UgW2ZpbmQgdGFyZ2V0L2lt
eDI3LmNmZ10KKyRfVEFSR0VUTkFNRSBjb25maWd1cmUgLWV2ZW50IGdkYi1hdHRhY2ggeyByZXNl
dCBpbml0IH0KKyRfVEFSR0VUTkFNRSBjb25maWd1cmUgLWV2ZW50IHJlc2V0LWluaXQgeyBpbXgy
N2Fkc19pbml0IH0KKworIyBUaGUgSU1YMjcgQURTIGJvYXJkIGhhcyBhIE5PUiBmbGFzaCBvbiBD
UzAKK2ZsYXNoX2JhbmsgY2ZpIDB4YzAwMDAwMDAgMHgwMDIwMDAwMCAyIDIgMAorCitwcm9jIGlt
eDI3YWRzX2luaXQgeyB9IHsKKwkjIFRoaXMgc2V0dXAgcHV0cyBSQU0gYXQgMHhBMDAwMDAwMAor
CisJIyByZXNldCB0aGUgYm9hcmQgY29ycmVjdGx5CisJcmVzZXQgcnVuCisJcmVzZXQgaGFsdAor
CisJbXd3IDB4MTAwMDAwMDAgMHgyMDA0MDMwNAorCW13dyAweDEwMDIwMDAwIDB4MDAwMDAwMDAK
Kwltd3cgMHgxMDAwMDAwNCAweERGRkJGQ0ZCCisJbXd3IDB4MTAwMjAwMDQgMHhGRkZGRkZGRgor
CisJc2xlZXAgMTAwCisKKwkjID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KKwkjICBDb25maWd1cmUgRERSIG9uIENTRDAgLS0gaW5pdGlhbCByZXNldAorCSMgPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorCW13dyAweEQ4MDAxMDEwIDB4MDAw
MDAwMDggCisKKwkjID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKwkj
ICBDb25maWd1cmUgUFNSQU0gb24gQ1M1IAorCSMgPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQorCW13dyAweGQ4MDAyMDUwIDB4MDAwMGRjZjYKKwltd3cgMHhkODAwMjA1
NCAweDQ0NGE0NTQxIAorCW13dyAweGQ4MDAyMDU4IDB4NDQ0NDMzMDIgCisKKwkjICA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisJIyAgICAgICAgIENvbmZpZ3VyZTE2
IGJpdCBOb3JGbGFzaCBvbiBDUzAKKwkjICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09CisJbXd3IDB4ZDgwMDIwMDAgMHgwMDAwQ0MwMyAKKwltd3cgMHhkODAwMjAwNCAw
eGEwMzMwRDAxIAorCW13dyAweGQ4MDAyMDA4IDB4MDAyMjA4MDAgCisKKwkjID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKwkjICBDb25maWd1cmUgQ1BMRCBvbiBDUzQg
CisJIyA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisJbXd3IDB4ZDgw
MDIwNDAgMHgwMDAwRENGNiAKKwltd3cgMHhkODAwMjA0NCAweDQ0NEE0NTQxIAorCW13dyAweGQ4
MDAyMDQ4IDB4NDQ0NDMzMDIgCisKKwkjID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KKwkjICBDb25maWd1cmUgRERSIG9uIENTRDAgLS0gd2FpdCA1MDAwIGN5Y2xlIAor
CSMgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorCW13dyAweDEwMDI3
ODI4IDB4NTU1NTU1NTUgCisJbXd3IDB4MTAwMjc4MzAgMHg1NTU1NTU1NSAKKwltd3cgMHgxMDAy
NzgzNCAweDU1NTU1NTU1IAorCW13dyAweDEwMDI3ODM4IDB4MDAwMDUwMDUgCisJbXd3IDB4MTAw
Mjc4M0MgMHgxNTU1NTU1NSAKKworCW13dyAweEQ4MDAxMDEwIDB4MDAwMDAwMDQgCisKKwltd3cg
MHhEODAwMTAwNCAweDAwNzk1NzI5IAorCisJbXd3IDB4RDgwMDEwMDAgMHg5MjIwMDAwMCAKKwlt
d3cgMHhBMDAwMEYwMCAweDAKKworCW13dyAweEQ4MDAxMDAwIDB4QTIyMDAwMDAgCisJbXd3IDB4
QTAwMDBGMDAgMHgwCisJbXd3IDB4QTAwMDBGMDAgMHgwCisKKwltd3cgMHhEODAwMTAwMCAweEIy
MjAwMDAwIAorCW13YiAweEEwMDAwMDMzIDB4RkYKKwltd2IgMHhBMTAwMDAwMCAweEFBCisKKwlt
d3cgMHhEODAwMTAwMCAweDgyMjI4MDg1IAorfQo=

------=_Part_270086_29876510.1231957635733--
