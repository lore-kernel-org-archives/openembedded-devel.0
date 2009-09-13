Received: from [68.180.197.99] (helo=web45606.mail.sp1.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <yildiz.abdullah@yahoo.com>) id 1MmnJJ-0004Mm-55
	for openembedded-devel@openembedded.org; Sun, 13 Sep 2009 13:32:04 +0200
Received: (qmail 79615 invoked by uid 60001); 13 Sep 2009 11:31:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1252841490; bh=H4NJkjxKploDiiRJ3oXFoBl+dv3647dVo3cTjDep3eo=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=2YtkEiw2YX8kjjSO7HEDjTBzjMUMXaO4QIW4EdeRlepkVNW4+rzijGXBAnjFWQE3kfjx9YVbcQ8cjNup59GulH79h3FJbMkeazjiz9Y5zgyUP05C99HvNJQatcU9MYCadN4KYOwcIN3lUEzoEJVmxRyG4hkSoOU4I/ItHSN9vwY=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=YL1NhygJtnA0G3cP1qDaQXQzrZcvEGXpQQjy21PlE01RTo5CLjmWy/2V8wgrEJBOumm1GThuepfYVzbtusYY4ziiGgCjXyEiE+MZ5R8Ce+bZ87TfFP/DDQkmt7hFmw0VrVAlLDtauaznPFq+LHTT9/5Q2jvEcD3rmkV7cY9Z1VY=;
Message-ID: <440980.75636.qm@web45606.mail.sp1.yahoo.com>
X-YMail-OSG: 5l6cHDMVM1mCD1AIhd2UsYZj0dxG3eUk46udjaZu5_G.VSldQkc8mSymPqwbdW.6ErAndl62n4yMeG.3ftI_erqgmzcz.aXVDLq_N3OoGtiMpZgWfNuLh_6hwzDP542ujV.EWGo1SC1Z59xBpkVR1CeN2rJ4ryV7NOjAw60SO6Rbg.sRJkhzAaclQ5xLoUAxfgkWi.dfh4CA3ldJizhYaw--
Received: from [94.120.240.239] by web45606.mail.sp1.yahoo.com via HTTP;
	Sun, 13 Sep 2009 04:31:30 PDT
X-Mailer: YahooMailRC/157.18 YahooMailWebService/0.7.338.2
Date: Sun, 13 Sep 2009 04:31:30 -0700 (PDT)
From: Abdullah YILDIZ <yildiz.abdullah@yahoo.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 68.180.197.99
X-SA-Exim-Mail-From: yildiz.abdullah@yahoo.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: x86 support
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
X-List-Received-Date: Sun, 13 Sep 2009 11:32:04 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I wonder that&#65533;whether&#65533;openembedded supports this configurati=
on:

VIA ESP10K
VIA CN333&#65533;North Bridge&#65533;
VIA VT8237R&#65533;South Bridge
&#65533;
Thanks..



From ospite@studenti.unina.it Sun Sep 13 16:02:19 2009
Received: from [85.37.17.114] (helo
