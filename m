Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radoslav@kolev.info>) id 1SPfxl-0007pH-WA
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 22:15:50 +0200
Received: by vcbfk14 with SMTP id fk14so23627vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 13:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=ljZ4n2Bta63u9O+TisWFTBHEctVNj5dwu6Ya2reItCA=;
	b=EHUce1hgWHm8Wt2W6+y21I9pk9JgF+r2k55VBDvWVoDqTWqwb8ahmhJgYGosSbYql5
	DuxmZn9caXrRsvOQI3pvsXafOdEqeER/4bjR25vYxErHr8gP4iVDe6ur3zudeBSbHBxe
	+D401FtrSGmRuDbeK2gGaLXAaob4UD1utSfgjY1hcYtnXFCQlXTwly41SY29KIcLe8ZO
	fj6KQqedLo3Pg4ZQZyRBMwGT77uQyoPSmVUEPp3cPLm3AEG4RJEyC5HureksZUzu+onO
	JZjDvTk3zaiuanDZM/VbU8/sgeAWhVkzmklMLp/J1SqNyM/0Pf0BxHSEH1riP0G69b7M
	BH1w==
MIME-Version: 1.0
Received: by 10.220.224.68 with SMTP id in4mr22245814vcb.24.1335989164502;
	Wed, 02 May 2012 13:06:04 -0700 (PDT)
Received: by 10.220.27.139 with HTTP; Wed, 2 May 2012 13:06:04 -0700 (PDT)
In-Reply-To: <CAC+thW1MhdQD9ofG1tyY7voJDPQXETvj2iFAgC9uNFDNUPJ6NA@mail.gmail.com>
References: <CAC+thW1MhdQD9ofG1tyY7voJDPQXETvj2iFAgC9uNFDNUPJ6NA@mail.gmail.com>
Date: Wed, 2 May 2012 23:06:04 +0300
Message-ID: <CAA5cW2w1pE6tZoZG6EL2AVRxQnKK14Cre4CMcXTQvvNjcJ4OCg@mail.gmail.com>
From: Radoslav Kolev <radoslav@kolev.info>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkm6nAaSNGA0aETNkMVK3BIqDAFDi5gLnxFUpQrsTj1CIHVeXl5XnaQh257zpqI4ekyANd7
Subject: Re: right directory for a recipe
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
X-List-Received-Date: Wed, 02 May 2012 20:15:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 1, 2012 at 10:10 PM, Andrea Galbusera <gizero@gmail.com> wrote:
> What would be the right directory to put libmodbus in? I understand
> recipes-* names are somewhat self explanatory, but I'm still confused
> if "recipes-extended", "recipes-support" or anything else is the best
> choice.

Hi Andrea,

the others seem busy, and I don't have the answer to your question,
but here's my advice - go ahead and port the recipe. Pick the best
directory you think suits it and submit the patches. Even if then
another directory is recommended the move shouldn't be much work.

Regards,
Rado


