Received: from ausxippc101.us.dell.com ([143.166.85.207])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sean_Hudson@Dell.com>) id 1OPho7-0006H9-JP
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 22:04:59 +0200
X-Loopcount0: from 10.166.62.177
From: <Sean_Hudson@Dell.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Jun 2010 14:58:54 -0500
Thread-Topic: [PATCH] Add a waf bitbake class.
Thread-Index: AcsPIK4CpCdlixutSjGKUk26ftQ03Q==
Message-ID: <113134CF306E8E4CACC27BE5937261B2092DDD2B99@AUSX7MCPS303.AMER.DELL.COM>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {7D2CD0A9-B7DC-4032-93D9-2408917ED98C}
x-cr-hashedpuzzle: ByRN DlQ9 Dr1h D+3w IVXD Ik7b JaSG JbX6 J33V KBKU KrkS
	L5Wb PCX0 PSQv Ph+u SgBb; 2;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnADsAcgB5AGEAbgBAAHQAcgBvAGwAbwBjAHMAaQBzAC4AYwBvAG0A;
	Sosha1_v1; 7; {7D2CD0A9-B7DC-4032-93D9-2408917ED98C};
	cwBlAGEAbgBfAGgAdQBkAHMAbwBuAEAAZABlAGwAbAAuAGMAbwBtAA==; Fri,
	18 Jun 2010 19:58:54 GMT;
	WwBQAEEAVABDAEgAXQAgAEEAZABkACAAYQAgAHcAYQBmACAAYgBpAHQAYgBhAGsAZQAgAGMAbABhAHMAcwAuAA==
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 18 Jun 2010 19:59:00.0346 (UTC)
	FILETIME=[B19DA5A0:01CB0F20]
X-SA-Exim-Connect-IP: 143.166.85.207
X-SA-Exim-Mail-From: Sean_Hudson@Dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_05,HTML_MESSAGE,
	MIME_HTML_MOSTLY, RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH] Add a waf bitbake class.
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
X-List-Received-Date: Fri, 18 Jun 2010 20:04:59 -0000
X-Groupsio-MsgNum: 20273
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_113134CF306E8E4CACC27BE5937261B2092DDD2B99AUSX7MCPS303A_"

--_004_113134CF306E8E4CACC27BE5937261B2092DDD2B99AUSX7MCPS303A_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

  We are using waf for some of our modules and decided to add a class to ma=
ke it easier to write recipes.

Regards,
Sean Hudson

--_004_113134CF306E8E4CACC27BE5937261B2092DDD2B99AUSX7MCPS303A_
Content-Type: application/octet-stream; name="waf.bbclass"
Content-Description: waf.bbclass
Content-Disposition: attachment; filename="waf.bbclass"; size=813;
	creation-date="Fri, 18 Jun 2010 14:57:22 GMT";
	modification-date="Fri, 18 Jun 2010 14:51:25 GMT"
Content-Transfer-Encoding: base64

IyBXQUYgcHJvamVjdCBjbGFzcy4KCkRFUEVORFMgKz0gcHl0aG9uCgpTVEFHRV9URU1QPSIke1dP
UktESVJ9L3RlbXAtc3RhZ2luZyIKU1RBR0VfVEVNUF9QUkVGSVggPSAiIgoKIyBDb25kaXRpb25h
bGx5IHNldCB0aGUgdmVyYm9zZSBvcHRpb24uCiMgV0FGX1ZFUkJPU0U9Ii12IgoKd2FmX2RvX2Nv
bXBpbGUoKSB7CgkuL3dhZiAke1dBRl9WRVJCT1NFfSBidWlsZCAKfQoKd2FmX2RvX2NsZWFuKCkg
ewoJLi93YWYgJHtXQUZfVkVSQk9TRX0gY2xlYW4KfQoKd2FmX2RvX2NvbmZpZ3VyZSgpIHsKCWlm
IFsgLXggJHtTfS93YWYgXTsgdGhlbgoJCSR7U30vd2FmICR7V0FGX1ZFUkJPU0V9IGNvbmZpZ3Vy
ZSAtLXByZWZpeD0ke3ByZWZpeH0gJHtFWFRSQV9PRUNPTkZ9ICIkQCIKCWVsc2UKCQlvZWZhdGFs
ICJleGVjdXRhYmxlIHdhZiBzY3JpcHQgbm90IGZvdW5kIgoJZmkKfQoKd2FmX2RvX2luc3RhbGwo
KSB7CgkuL3dhZiAke1dBRl9WRVJCT1NFfSBpbnN0YWxsIC0tZGVzdGRpcj0iJHtEfSIgIiRAIgp9
Cgp3YWZfc3RhZ2VfYWxsKCkgewoJLi93YWYgJHtXQUZfVkVSQk9TRX0gaW5zdGFsbCAtLWRlc3Rk
aXI9IiR7U1RBR0VfVEVNUH0iIAoJcm0gLXJmICR7U1RBR0VfVEVNUH0vJHttYW5kaXJ9IHx8IHRy
dWUKCXJtIC1yZiAke1NUQUdFX1RFTVB9LyR7aW5mb2Rpcn0gfHwgdHJ1ZQoJc3lzcm9vdF9zdGFn
ZV9kaXJzICR7U1RBR0VfVEVNUH0gJHtTVEFHRV9URU1QX1BSRUZJWH0KCXJtIC1yZiAke1NUQUdF
X1RFTVB9Cn0KCkVYUE9SVF9GVU5DVElPTlMgZG9fY29tcGlsZSBkb19jbGVhbiBkb19jb25maWd1
cmUgZG9faW5zdGFsbCAK

--_004_113134CF306E8E4CACC27BE5937261B2092DDD2B99AUSX7MCPS303A_--
