Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKa9i-00027Y-0Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 18:26:18 +0100
Received: by iwn7 with SMTP id 7so30421iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 09:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=5DRtPzqG0MkzTzTJ+/8kZbGEt7CIzlb61KlOK3RIsew=;
	b=qaihK6W5uPVvywDCcEDJK+sA865N5wJ49/swaH3yoEGbh1vyUQ/2+jCHz2Ca/eIIl/
	F8YG52i2iHYYLc3fwNkUllwrWok4YcJeY0PpKP5sT8b5JubD4u9DL/KblfbSgLfxhKPX
	5losuz61rOBi6Arh4fVQN3vjFEHDQavbuTlAU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=B5BMVDC2Z1r1K8AFAqnb/SoQQNr4oCOsAfzkuxUbkmfrrBC1xgTY8o/3gp73Wmwwh3
	FCIOwnnNgOpbxYkFOUBk7RV+V6176+WpT3G4V72N+PyI2s08gjDccivxwXXyNUOgrnCh
	MjUZRPcMbFgMuX4NH73hWSIeQQlGTN4a+XVBY=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr7113872ibd.26.1290446705603; Mon,
	22 Nov 2010 09:25:05 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Mon, 22 Nov 2010 09:25:05 -0800 (PST)
In-Reply-To: <4CEA88D0.7070100@sensortherm.de>
References: <4CE64779.3020802@sensortherm.de>
	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>
	<4CE7D1F2.7010305@sensortherm.de>
	<AANLkTi=VB3EJo1DU2pGWgCSqFrZX81t1Es4xTHP3eCWU@mail.gmail.com>
	<4CEA2BFF.5090707@sensortherm.de>
	<AANLkTimabe75SmdGTA5EemH83-4Yd7KjNwdx8D3dCNR6@mail.gmail.com>
	<4CEA88D0.7070100@sensortherm.de>
Date: Mon, 22 Nov 2010 18:25:05 +0100
Message-ID: <AANLkTinRPF12o0qhpPq=qohG9E6tXRYTd58uB0itKEQ1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
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
X-List-Received-Date: Mon, 22 Nov 2010 17:26:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Note that some of the errors Klaus reported are due to the outage of
www.handhelds.org.

Frans


