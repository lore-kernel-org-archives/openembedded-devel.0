Received: from cluster-j.mailcontrol.com ([85.115.54.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <David.Aldrich@EMEA.NEC.COM>) id 1TIeAx-0003M9-GQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 13:28:39 +0200
Received: from mail2.neceur.com (mail2.neceur.com [195.47.207.4])
	by rly43j.srv.mailcontrol.com (MailControl) with ESMTP id
	q91AVQLU017642 for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Oct 2012 11:31:29 +0100
Received: from intmail1.neceur.com (intmail1.neceur.com [172.29.14.11])
	by mail2.neceur.com (8.14.4/8.14.4) with ESMTP id q91AVQAU000454
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Oct 2012 11:31:26 +0100
Received: from av2.neceur.com (av2.neceur.com [172.29.177.7])
	by intmail1.neceur.com (8.13.8/8.13.8) with ESMTP id q91AVQKg012179
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Oct 2012 11:31:26 +0100
Received: from av2.neceur.com (unknown [127.0.0.1])
	by IMSVA80 (Postfix) with ESMTP id 37932226F0F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2012 11:31:26 +0100 (BST)
Received: from EX10CAS01.EU.NEC.COM (unknown [172.29.155.132])
	by av2.neceur.com (Postfix) with ESMTP id 29636226EF4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2012 11:31:26 +0100 (BST)
Received: from EX10MBX02.EU.NEC.COM ([169.254.2.52]) by EX10CAS01.EU.NEC.COM
	([172.29.155.132]) with mapi id 14.02.0309.002; Mon, 1 Oct 2012 11:31:26
	+0100
From: David Aldrich <David.Aldrich@EMEA.NEC.COM>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Help needed to build a package
Thread-Index: Ac2fv+cMTjkBmkeURXC/NxlGASvJ4w==
Date: Mon, 1 Oct 2012 10:31:25 +0000
Message-ID: <41302A7145AC054FA7A96CFD03835A0A18B4EC@EX10MBX02.EU.NEC.COM>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.29.68.109]
MIME-Version: 1.0
X-Scanned-By: MailControl 9446.0 (www.mailcontrol.com) on 10.74.0.153
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Help needed to build a package
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
X-List-Received-Date: Mon, 01 Oct 2012 11:28:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

I am new to openembedded.  I hope it's appropriate to post a user question =
here. If not, please suggest a more appropriate mailing list for me to use.

I am using the arago repository and am trying to build the openssh package.=
  By build freezes part way through:

$ MACHINE=3Dmymachine bitbake -D -D -D openssh
<snip>
DEBUG: LOAD /home/<snip>/arago-oe-dev/recipes/simpad-utilities/simpad-utili=
ties.bb
DEBUG: update_data()
DEBUG: update_data()
DEBUG: update_data()
NOTE: Handling BitBake files: - (5013/7639) [65 %]

How can I work out why bitbake hangs at this point please?

Best regards

David


