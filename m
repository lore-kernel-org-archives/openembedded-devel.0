Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lys2u-00021e-8Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 20:28:46 +0200
Received: by yw-out-1718.google.com with SMTP id 9so441589ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 11:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JBYTY0/E6uSDDvv3VEvgE2/odxxPBNOzVYSr0fDRp4Y=;
	b=USLGIVajnzKuOU3cZR285uVXfo3rdpVdnu1D+G3mHSxTPgW4mtzFMcA7a5eSuhtpjy
	rbkUQLILH8xq0uc+KwjyssbZPk8bkaR8ClspAMRp11SX6nhjreRqQ0//+wDdXI7GS/g9
	QgAksYiwvBGmT+TCq/17p4zgKji826b/Rym9I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=L0J2OBYG6N2R9jcdXkeIufceTpTQqXTQpzCrlqKbqQfJftuolIyBPufOwGhewjsfb3
	GapLlvsgQRpeutTpON3rlw2kdZsUmkZtivy3USikHRq8/GBBQl/bw5J8R+oOxutCpWbt
	PJM3a6KWpl2cApmrgOv1fChXzDatuhpWGPFGs=
MIME-Version: 1.0
Received: by 10.151.68.7 with SMTP id v7mr11382078ybk.131.1240943013598; Tue, 
	28 Apr 2009 11:23:33 -0700 (PDT)
In-Reply-To: <1240929710.30742.102.camel@mill.internal.reciva.com>
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<200904252034.35801.mickey@vanille-media.de>
	<49F35A2B.7070907@xora.org.uk>
	<200904252144.45513.mickey@vanille-media.de>
	<1240929710.30742.102.camel@mill.internal.reciva.com>
Date: Tue, 28 Apr 2009 14:23:33 -0400
Message-ID: <f96d234e0904281123sb23e07fw89fe856e6c851ae5@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Tue, 28 Apr 2009 18:28:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, Apr 28, 2009 at 10:41 AM, Phil Blundell <philb@gnu.org> wrote:

> If we are to have a core team as the governing body for OE then I would
> like to see it taking a more active role in overseeing the project (in
> particular, to guide policies for technical issues and not merely focus
> on administrivia such as the formatting of commit messages or
> Signed-off-by lines), and for this to be done in a more transparent way.
> If the current members of the core team are, for whatever reason, not
> willing or able to discharge those duties then (much as I hesitate to
> call for this) perhaps it's time to hold elections and appoint new
> members in their place.

One possible path is to:

1) figure out how to get members added to the eV that is already in place.
2) hold elections for a board

In the absence of an active benevolent dictator, I see regular
elections as the only path forward.

We also need to stop waiting on the next OSS event to take the next
step.  We can host conf calls, etc -- whatever it takes.  Documents
can be scanned/emailed -- we don't have to be in person to sign.  KDE
seems to have a process for adding eV members.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


