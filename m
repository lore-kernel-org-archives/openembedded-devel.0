Received: from [209.85.134.189] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1JodOq-000426-PE
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2008 13:44:32 +0200
Received: by mu-out-0910.google.com with SMTP id i2so3508933mue.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2008 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=Pju6NMVEE2hXPZC4C8Z5qxM/irhgOuX7jNKm0g9Ynno=;
	b=sf6ToYtiTgTLLQvT65+/aCsECVEiijO21AdOTRm1X+fbHByp4xkC/S3yTx91R/mKYzb6OB4kZ9VftcYP1iZravQlGgDQufndj1zlSctQfyqpbSks8WVYeYKgIXPsTEU823HlsfEg8okxjoEmwXIrZVQDLpqfPJzIfcnPizVN7sI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=GiLCL88R2aigzPqaC8ryg+ONAhJqX0/l19vt2nJcfe1VL4QnfeRQ6I+hAA/01oNBUuzGXzAumZ1NXC57fMn7//L9ZE6+eNZUJC4hTnxSIAE4XfMk8JD2fc+DEpbb7EpFeE2GrT7lKsD33VgFx2TdY4ngYTOnYlkWpHNJRT+yW2I=
Received: by 10.78.150.7 with SMTP id x7mr932021hud.41.1208951066236;
	Wed, 23 Apr 2008 04:44:26 -0700 (PDT)
Received: by 10.78.161.14 with HTTP; Wed, 23 Apr 2008 04:44:26 -0700 (PDT)
Message-ID: <35a670560804230444j7706a535u818d812d72f77649@mail.gmail.com>
Date: Wed, 23 Apr 2008 13:44:26 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <480EE63D.8070208@gmx.net>
MIME-Version: 1.0
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
	<47FE2530.2@gmx.net>
	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
	<4800DC3B.9080007@gmx.net>
	<35a670560804140932s53231dcj1adfa6bc21e0353e@mail.gmail.com>
	<35a670560804150810k603d1986t4e02eefa7f411728@mail.gmail.com>
	<480596E2.7030906@gmx.net>
	<35a670560804210337x73d63394t3e6b4feb0ee5118e@mail.gmail.com>
	<480EE63D.8070208@gmx.net>
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 23 Apr 2008 11:44:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Apr 23, 2008 at 9:33 AM, Robert Schuster <theBohemian@gmx.net> wrote:
>  Btw: Your statement that 4.3 is not widely in use is not quite right:
>  Fedora 9 and Debian Lenny are build with it or are in the process of
>  transition.
Ok. I'm not sure how widely deployed the Fedora and Debian ARM
distro's are, but that sounds at least positive.
I'm going to give GCC 4.3 a spin and report back.

Matthijs.


