Received: from [209.85.221.178] (helo=mail-qy0-f178.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mtavp-0001gX-R8
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 07:43:56 +0200
Received: by qyk8 with SMTP id 8so690896qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2009 22:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ueo57tDISvB+PcIk2inApOYGiUpiBhjv/wIXns1LQeo=;
	b=Z6muhjOU/9hpQgoyz3vzCP5Wu9yeVYcTrzVz3GgWTstohZJS2o7W04nJsjUm2z/aQm
	MQR715Y7KzE2jsFejyZ0lYsiMoXKYIcCKP53zPSrX1kwETLhl+h9MWwMur9FlEQuCucA
	UXW4RwuG1uNWPtw5KJWEr3aO6O+mrkBpo2HjE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=r+g5ueqL8JmWPfshdQY5InKyfwZQqRHtmaOIktkGB56aRt/HgYB518QC/Kh29izi/h
	PShkAGua7HmI+B3jVGQ9e0dFWWx2DetgOXy/7HoP1ub0Cud4e/1ptQUegA5lZp7aqhYu
	71u+mlWIeC8RYOYG81bx3XHm0Sf+Z8yoJLyBE=
MIME-Version: 1.0
Received: by 10.229.43.77 with SMTP id v13mr2691111qce.82.1254461799520; Thu, 
	01 Oct 2009 22:36:39 -0700 (PDT)
In-Reply-To: <1254452313.25385.2.camel@ed-hp-laptop>
References: <1254452313.25385.2.camel@ed-hp-laptop>
Date: Thu, 1 Oct 2009 22:36:39 -0700
Message-ID: <19c1b8a90910012236waaa6e10g2ff0335459eed59b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Message - %n in writable segment detected
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
X-List-Received-Date: Fri, 02 Oct 2009 05:43:57 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2009 at 7:58 PM, ed <enelson1000@comcast.net> wrote:
> I get this message in the log.
>
> NOTE: Running task 40 of 2678 (ID:
> 1757, /home/ed/mini2440/OE/mini2440/recipes/m4/m4-native_1.4.12.bb,
> do_patch)
> NOTE: Running task 41 of 2678 (ID:
> 1758, /home/ed/mini2440/OE/mini2440/recipes/m4/m4-native_1.4.12.bb,
> do_configure)
> *** %n in writable segment detected ***
>
>
>
> Is this something to be concerned about?


I dont think so. You can ignore it.
>
> Thanks
> ed
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


