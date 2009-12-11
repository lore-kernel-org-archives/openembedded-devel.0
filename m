Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1NJ4R2-00087h-C4
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 13:17:27 +0100
Received: by pxi13 with SMTP id 13so628732pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 04:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=LCiVAQO6rnrCkTPKDX6hMBKIvgEORDKLhNH2tvgXjVg=;
	b=NwWiSQC7gVsgRWl3Wicfm5n30tuUm1TmPRf97OZaxUl+8hXrW0pwYAPcXekLj+OZR7
	xNrl1F881iJEmGcVM8AdYsg1Y/KiJbyUG0zYdmgNjP1iSO8MdSOn5F3uil6Y5GJeK5Jx
	qd/M+qDjcUmNhMUm5Om+OYezSYpTuOGhjDKM4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=M8W5Hp8cp5oDVqlFIn5XkP7rY6v6KkCmxDkMKS414rS6wADwO6Si3fd2KZ4FK65OmJ
	RB6eE9dwb7JugN3e5CQTmNVxuTjmz7+cWJCAZz+HA/CEoXfV5cLwXMeF8Vl2F3EheRSF
	UGO12xcyWfcMCIAWjFbmrolc3qWJJpoOda7dc=
MIME-Version: 1.0
Received: by 10.115.24.12 with SMTP id b12mr799486waj.86.1260533740689; Fri, 
	11 Dec 2009 04:15:40 -0800 (PST)
Date: Fri, 11 Dec 2009 17:45:40 +0530
Message-ID: <ad82c8890912110415jde47da1kde90de8fdb2b56fc@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: choosing correct flash image for Compulab EM-X270
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
X-List-Received-Date: Fri, 11 Dec 2009 12:17:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
        I compiled linphone successfully.Now I wanted to create flash image
for linphone to port on Nand flash.
Please tell me which image i have to choose for compulab EM-X270 in
recipes/images to build image.
and also tell me that what changes i have to do for .bb image file to build
image for linphone.

with regards
vivek tambakad

