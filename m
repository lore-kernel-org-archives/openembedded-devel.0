Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OngKj-000057-FN
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 01:22:00 +0200
Received: by fxm6 with SMTP id 6so3694459fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 16:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=rgU1v1eYEYZfH0snOjf7xYWI4qRl8i3LZ/nxnkConNk=;
	b=tYMYZF2rO8y6HW6msUT8r8r2wDWvGSDT6Fn6UXDunV5tN0yVkwZbIhnkiFkJD5eJVk
	jEEc/ccDdPbvrUvteOBV9fAY44svPO6NSgmKsuxrL2sTQhG4xou1xrcCBH+xNsKBdLjL
	S8fWxePBCHChpBfVr9Jfp5TioYQEJ/rVZY2yA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=n96rkwJS1IFScrDKg0l6RNKyJKJqEtNCN4Q6qWqi0Bg0G3pjsSSH8Ldh93p12LTK3x
	GGGjd9/Um37Ejc321Q50r5jdjtpZOWyTPTJ5dw+hFq4dSqmfsIXwJ7UEI+n5+qp3GY2O
	qIoXZP4XuiJndYoF5jy1iA7inDV9klqsYU36M=
Received: by 10.223.103.134 with SMTP id k6mr5248160fao.5.1282605671203; Mon,
	23 Aug 2010 16:21:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Mon, 23 Aug 2010 16:20:51 -0700 (PDT)
In-Reply-To: <1282601926.3775.10.camel@mattotaupa>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<AANLkTi=bCxyXU+mubbmFcrtUsHiVsmtsDw0235E69XRd@mail.gmail.com>
	<1282556402.3853.17.camel@mattotaupa>
	<AANLkTimWTfusnW2REvKOhH+vnjS=4EFrKV5DvDNOoYo5@mail.gmail.com>
	<1282601926.3775.10.camel@mattotaupa>
From: AJ ONeal <coolaj86@gmail.com>
Date: Mon, 23 Aug 2010 17:20:51 -0600
Message-ID: <AANLkTi=UpiaG4DnKT2UdZwnv+isUsLwk0rTL7tZuYi6r@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Mon, 23 Aug 2010 23:22:03 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

>
> > > Please also remember to update the patch queue [2].
> > >
> >
> > Update it to what?
> >
> > That link you gave me is very unclear
> >
> > It is desirable to update the state of the patch in the patch queue. Th=
is
> > > could also be added to the script.
>
> This sentence addresses the case when your patch is accepted.
>

I already marked the first two as superseded


> > The patch is listed as "new". I'd agree with that state. It certainly
> isn't
> > "accepted" - that's someone else's job to put that, right?
>
> Reading the reviews your patch got you need to improve it a little bit.
> So after you send in the next iteration of your patch =96 v2 in our case =
=96
> you should update the state to superseded.
>

If you look at the newest patch I already implemented all of those changes
excepting that I didn't do the Signed-off-by and the patch includes the [v2=
]
in the commit message.

Do you still want me to submit again with just those changes?

>> All I do to add that is --signoff, correct?

> No. Please take a look at the link I gave you [1] and the other patches
> sent to this list.

Again, I don't think that's very clear

- Include a Signed-off-by: line indicating the change has valid certificate

of origin as per the Linux kernel


What is a valid certificate of origin?

How about an example? You correct me where I'm mistaken and then I'll copy
this to the wiki as reference




Let's say you create a new recipe and you'd like to submit it for inclusion
(and you've already tested that it works, of course).

Now commit with a good strong helpful message

    git add recipes/nodejs/
    git commit # don't use the -m option

The message should look like this

    added recipe for node.js

    * added recipe for node.js (bug #5555 - no nodejs recipe)
    ** patched libev's wscript to not try to execute code
    ** patched node's wscript to not search in '/usr/include'

    Signed-off-by: AJ ONeal <coolaj86@gmail.com>

Create your patch

    git format-patch -1 # or however many commits are part of this change

If you are submitting a second version also add "--subject-prefix [v2]"

    git send-email

Your patch will be immediately visible on
http://patchwork.openembedded.org/patch/
Once your patch has been accepted or rejected, update the status to
"accepted" or "rejected"

If you get soft-rejected (a lot of feedback), make the changes, submit the
next version, and update the status of the previous patch to "superseded"

Appendix: Properly configuring git (using tekkub@gmail.com as an example
user)

    sudo apt-get install git-core git-email
    git config --global user.name "Tekkub"
    git config --global user.email "tekkub@gmail.com"
    git config --global sendemail.smtpserver smtp.gmail.com
    git config --global sendemail.smtpserverport 587
    git config --global sendemail.smtpencryption tls
    git config --global sendemail.smtpuser tekkupl@gmail.com

