Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 32D9E6E64A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 17:41:55 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so200946368wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 10:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=jFC4LhPNk7Zte7dPFSWK5Sva7PJDa9j5lnWXm7azO3k=;
	b=c5RTlcmG1TAmmAW1YlwiUpB9o7uwREukLC8Ik2xkKrg2Cf5nrPML3t2sTYoTWwDt6F
	/oPRoNbQVrUmcjTfAZkIJe2EYckVdzu5Rv3+P8nxTj+QNwL92TgGawtRKa079d/3XX6d
	BRWuOo+khwZBDeHeQ9EwuzPMM3mPEq8fY3gts54cuu/w3DbFn/bGpsZ4S2qkXPYJixTw
	XVn7nTlo/p67F+L4Q9xMGBi+n0lZ6lxTLjM3aR+VCpF4UPmmIfATByb0hytd5tuEIFv9
	ipuSIc+zFdnRPOZKv1/7iYjrpief7NEKUma491Pk3c3bQhkQCNMUjd4Iu7mNT4eEJuWp
	/SHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=jFC4LhPNk7Zte7dPFSWK5Sva7PJDa9j5lnWXm7azO3k=;
	b=d4h7PIrC1rdqsiotqdFRjEVJqksAeUL7LOcWtiVpUU4IYqXtNS6CMWU122k3tLWSA9
	wCPzndUGQzs0cXOuRBavfKWZn+W6t4S0YnmqrnDqKdXk1ftlrezdWNYxRjJOKvq1uHfR
	k0xCvz61eBkvqWWYtTw+bleTOiPVnOzyl4Z3sjz/jzlViC4sh1W+VkcuREcftzAVc676
	vEcV5GZKuZMwdSbVW/HBwR3EG7cutgpjiWIVJt3QsXs/dJvM+7J/xoI7tzyyjpiLBlxy
	D6DeLPnth25zRq+1g6SpvCSrCv5D9/DShFwEYc/xLmdzNNEdPAph0i4+zemNc3++DgRx
	gIuQ==
X-Gm-Message-State: AD7BkJJsuvQPYlyINVal87SBvyrQ2gb6zLOR3+QFLFVr67uvHgyTsEWX3tllebA/FglgvQ==
X-Received: by 10.194.23.7 with SMTP id i7mr5197374wjf.9.1458150116162;
	Wed, 16 Mar 2016 10:41:56 -0700 (PDT)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id i5sm4025009wjx.15.2016.03.16.10.41.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 10:41:55 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Wed, 16 Mar 2016 18:41:53 +0100
Message-Id: <FDFA07CC-D6C7-438F-8FE8-345C2A226C26@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [meta-cpan] pushed to master
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
X-List-Received-Date: Wed, 16 Mar 2016 17:41:56 -0000
X-Groupsio-MsgNum: 60531
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2F5838E6-D8E9-4427-AF57-53A9F325F766";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_2F5838E6-D8E9-4427-AF57-53A9F325F766
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

I pushed following commits to master of meta-cpan =
(https://github.com/rehsack/meta-cpan)

6b1f323 net-dns-perl: add recipe for Net::DNS
4d01125 moo-perl: update to 2.001001
c0049e3 mime-types-perl: update to 2.13
24f2213 devel-stacktrace-perl: update to 2.01
9757a34 data-munge-perl: update to 0.096
939fd5d class-method-modifiers-perl: Update to 2.12
293c32c capture-tiny-perl: Update to 0.36
722850b perl-tidy-perl: Update recipe to 20160302
37f5371 log-any-adapter-daemontools-perl: Add recipe for =
Log::Any::Adapter::Daemontools 0.101
a0d6f66 file-touch-perl: Add recipe for File::Touch 0.11

At end of February, those where already pushed:

c7c5266 encode-perl: Update to 2.82
59cb8a8 regexp-common-perl: Update to 2016020301
ca63f61 text-csv_xs-perl: Update to 1.22
eb07ebb yaml-libyaml-perl: Update to 0.62
95dac2f datetime-format-strptime-perl: Update to 1.64
caf1cfb crypt-pbkdf2-perl: Update to 0.160410
d103a68 io-socket-ssl-perl: Update to 2.024
23771f5 path-class-perl: Update to 0.36
44a5080 moose-perl: Update to 2.1605
2466782 scalar-list-utils-perl: Update to 1.43
74a3c03 params-validate-perl: Update to 1.22
a01a1dc log-any-perl: Update to 1.040
89a9485 capture-tiny-perl: Update to 0.34
f11ac8d dbd-sqlite-perl: Update to 1.50.
e121472 netaddr-ip-perl: Add recipe for NetAddr::IP 4.078

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_2F5838E6-D8E9-4427-AF57-53A9F325F766
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW6ZriAAoJEESZlq7c5QqdHE0P+wSDQqM6X1GijKhOGfHtljd/
6ChfzH25svMwkp7ncNyiUutahgtVIh8DQTfZ+5Wxbe1fi0dvuaiYDuZMMQiVCm7w
GxJxU5o69oz3u8ig1TLVfRjojwKBrPuWMu4VKicp0iSL0t4Pp27riSMPDXwhZIoA
8rKwc1KHoT6G+ucb2gPhPCRTydWKGMb42ily1r4LuxzRkjCQoK33wN8cxNSK0hoV
voCZWLxuAOmsqfxxSNDCtaxaJz7Fv8EEO7HE7Y4USBHsZwLk9OTA/kqrQkkkTVT6
7C6vcE03cOvx/yZDnG/IpNg+vOkpP1U0KH+U0DGYvPeYGUMdFypwmE9CuQx/hOK0
/rN+T/Yd91dX5BfZRJC871Vjv25cIOaW3OTG80b1BstBO/5KGVIEM+2EwuXZugOa
dAnSoG7LpI7yFxcjOlG2AZV+06dxppMVqJKw0LogLvPEpMtl6mda1VkBfS/D//6O
bH5uC1aVr+Z47eKjJzvor5WmH7f2igZhK1aqaDVdhkjG5x1SXPIDi7Uw0a56wF65
tZYtthHz3VGzzd60Z+NNaciYuLf+RRMzk2CughmiCHHGbWBNMwJa31R25/gZZhDZ
GNRilnspMSTTxzabOPSemDklwB8ZgxTuIahAM0Djz3Ct01++m3I4UmrjX+KIDLHN
MsLCp3GGoSSnxFZtUPw3
=pDuR
-----END PGP SIGNATURE-----

--Apple-Mail=_2F5838E6-D8E9-4427-AF57-53A9F325F766--
