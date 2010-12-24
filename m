Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PVw5N-0005Cm-A5
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 02:04:45 +0100
Received: by wyb40 with SMTP id 40so6789831wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 17:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Lm2LR2aKu6tmQzEtAWB4yr0+bH0wA3YuI0BdeaCiGCI=;
	b=GIvGwJdOgmP4N1eSpRIovDih6qIeXKKZRFyQifjs9aah+AvOvnDzLig8H3hAIyzdTm
	WB+PKHJpHl8wNfW84QffXRjWTNgBDZPUfCbo+Uf4dkvHAYLm4Ixg//xK9I04lgnZvoyu
	1NzcQrOJSBfMWJU712f2NgoHU/+P6BZszA4+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SBX/o2bFqfGVyFdMlvj3BZUsiXU5IFjOiCSECg18wpDIzTVBcEIaVfc1s3cKEdQV7Q
	9oS/2x+S4uuiD3a04iaE5hTxx27IwPBRDkJfXg5LudeUvJ1PSrAKICQad/sOAsyxDbmm
	WR94KGU9AouJVRJb48jQ4znJ+65aLYVJuDnhk=
MIME-Version: 1.0
Received: by 10.216.169.71 with SMTP id m49mr9835870wel.4.1293152675647; Thu,
	23 Dec 2010 17:04:35 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Thu, 23 Dec 2010 17:04:35 -0800 (PST)
Date: Thu, 23 Dec 2010 20:04:35 -0500
Message-ID: <AANLkTin7z1wu1hewCq9f=PCwoYv3-JrCj2OPXf0V6jWc@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: testing branch 2010-12-23
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
X-List-Received-Date: Fri, 24 Dec 2010 01:04:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

master has been merged to testing-next and is ready for clean builds.

Last weeks testing branch did not fare so well, so no tags.

For more information on testing, see:

http://www.openembedded.org/index.php/Testing

Thanks,
Cliff

-- 
=================
http://bec-systems.com


