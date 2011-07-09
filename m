Received: from nm5-vm0.bullet.mail.ukl.yahoo.com ([217.146.183.232])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <comte_fabien@yahoo.fr>) id 1Qfb2Y-0001MJ-2G
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 19:10:02 +0200
Received: from [217.146.183.214] by nm5.bullet.mail.ukl.yahoo.com with NNFMP;
	09 Jul 2011 17:06:08 -0000
Received: from [217.146.183.171] by tm7.bullet.mail.ukl.yahoo.com with NNFMP;
	09 Jul 2011 17:06:08 -0000
Received: from [127.0.0.1] by omp1012.mail.ukl.yahoo.com with NNFMP;
	09 Jul 2011 17:06:08 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 64462.34539.bm@omp1012.mail.ukl.yahoo.com
Received: (qmail 52984 invoked by uid 60001); 9 Jul 2011 17:06:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s1024;
	t=1310231167; bh=0DoJG0EDor250IR+ZWNcdWlIfsfEdQ9hH/SBx98jBrg=;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=NgyH5dEOb4xHGavIcknhZQnR0NlFHXhJDSj/c/RoOFMwiQhEnXGlf0VIOh5lrtxftGXlBMZiKPLONc5MxV+MqkdMNsVjOiOX5DXAFSdJJEPQgWc5luyHBM0X6ESdR+e0f1hPwyoY2ReUUXO9v5CVHEwYiMBgxQOLcZX3QKqKt/U=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.fr;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=mExMGP7VFaovvkf42xvMyXxwgfwYd7SpwkAAmceh/wnfKQsQINucMhc1zDUDnqZRUePyNdDmks0CqLX9spcADokSup4viE9WO/T/5q02+mtncF+HQq9cfG2TZ/lS4BYVt0bVlmuabhoN84x2twDVIh8xmim+p90XOmKx/E3iFns=;
X-YMail-OSG: qFC0X.sVM1k2nlzaennrheQl_Jv02hWbGbjb79iQxkjlzxo
	DKD3uvAVwbqLlVqhd0iDl9N8EFEL968LNFgAXK4wxggb2D0gAjnUE1LsCgz2
	9VQVb8ZVbsUMi2NSEEmNfEmmdlkq4.R5oeJiAEgh_z_tN3XgARKTKl4AVJDo
	XrwTbUF.RpHvMiNnlV5X4E3ecu8LNv4.k4vx5QJNRWfFn5AT1aYw6oU0Q1UH
	V6pdUo5cgGNZJwd1jpMfadw686Sqo6KZfuBFZk_FNpnT5bG0RjFmpEIqT6Uk
	2uno8y0iUg6vz.zru5BZ0pEd2VBUQmzgWDc4.VJFb4LajiXblXhDXKoG78ck
	Md4qdz_7nQyUir2qZereGH7MYqpQ_yrTI59mnoFnN4tlu3rV4WqklE0_lDaa
	iWC2._9QG0JK5csMd5pS_lN.p.szZy7taRSVprqtR6Aori04GK7K9Sm8YNXj
	Us0ohPj7hQ3P9aGPEJExlsalHwYGM_5mzUlhB4P3YY7hK445XyLZCdZfFDnC
	Cy_FcAOoLsjY790lGCbb2ZX.O8z_zQZ64ynXUw9IUnlToTOEfjLP81yMcS5W
	n588gkQWFtOQFkHXdrN3SR9xze5vc8Akec34gV3UNrZ2UUlq8Nlo7GPeYvKf
	pa5YHgp2clloLDdfnE0lgxt2aOeih0T497i4-
Received: from [84.6.16.173] by web27501.mail.ukl.yahoo.com via HTTP;
	Sat, 09 Jul 2011 18:06:07 BST
X-Mailer: YahooMailWebService/0.8.112.307740
References: <1309949864.34662.YahooMailRC@web27502.mail.ukl.yahoo.com>
	<1310217452.54283.YahooMailNeo@web27502.mail.ukl.yahoo.com>
	<1310219700.4123.127.camel@mattotaupa>
Message-ID: <1310231167.51747.YahooMailNeo@web27501.mail.ukl.yahoo.com>
Date: Sat, 9 Jul 2011 18:06:07 +0100 (BST)
From: fabien comte <comte_fabien@yahoo.fr>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1310219700.4123.127.camel@mattotaupa>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re : update proposals
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
X-List-Received-Date: Sat, 09 Jul 2011 17:10:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,
&#65533;
Does a wiki page exist with all the informations to do the job right ?
&#65533;
About the icedtea bug, the bugtracker is closed so how to report ???
&#65533;
Thank you,
&#65533;
Fabien
&#65533;
&#65533;

De&#65533;: Paul Menzel <paulepanter@users.sourceforge.net>
&#65533;&#65533;: openembedded-devel@lists.openembedded.org
Envoy&#65533; le : Samedi 9 Juillet 2011 15h55
Objet&#65533;: Re: [oe] update proposals

Dear Fabien,


Am Samstag, den 09.07.2011, 14:17 +0100 schrieb fabien comte:

> This archive contain some updates for recipes. Could you integrate it ?

thank you for your updates. Unfortunately we cannot integrate those as
is, because they do not follow our commit policy [1].

Please submit each change separately with a description of the problem,
the solution and your Signed-off-by line.

> All are ok but I cannot rebuild jamvm 1.5.4 since icedted build fails.
> Could you fix icedted if you want that I test jamvm again (i did it
> few month before and it worked) ?

Please open a new thread for this problem with a descriptive subject
line so that people can help you [3].

> I hope that it will help some users.

Thank you for your improvements and hopefully you can spend another our
to format your updates correctly so that we can include them.


Thanks,

Paul


[1] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedde=
d
[2] http://openembedded.org/index.php/Commit_Policy
[3] http://en.opensuse.org/openSUSE:Mailing_list_netiquette

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
From paulepanter@users.sourceforge.net Sat Jul 09 20:17:11 2011
Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qfc5X-0002Lt-Kd for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 20:17:11 +0200
Received: from f053045224.adsl.alicedsl.de ([78.53.45.224]
	helo
