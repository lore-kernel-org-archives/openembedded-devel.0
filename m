Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PtTiy-00063u-0c
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Feb 2011 00:38:56 +0100
Received: by wwb29 with SMTP id 29so551436wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Feb 2011 15:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=HI3+p0LksY38R87+O0S5jWIBlrusJUgIkVpY53KA/Ck=;
	b=uZVO6nN/RhkkV421oXjWT+WZtvWoJqgpivr9d+AlpygjemwQAMHf2U0aoA/m5og6C2
	kyzLTH4fLIxkWONcH0qDOUgmI2fdo9DPpV0mH0IDzi05WGfdVoB6pyVCjZ7/mauIKz1P
	LhKtTgtRNxUIGQMe3KLtuZTxe0KCI4FaqUQQ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=JV+CnOQXJuM/MU7dsBgFRKxq+NN0pH1wAbeFX1/OEv0xuY9v5eqYaExSNRRoHqjxjx
	6JJqL5r5jb1Rz6lUXm55Xl7T7hJZ9rUInmfDqjYV8IirwgDjiS+5zcYF1BO4PQAhfccT
	laFDRcQft1ST8Nj004HUeHPm6+FohEv+fYx+4=
Received: by 10.216.18.83 with SMTP id k61mr3241870wek.91.1298763452332; Sat,
	26 Feb 2011 15:37:32 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.246.11 with HTTP; Sat, 26 Feb 2011 15:37:12 -0800 (PST)
In-Reply-To: <AANLkTikzpcKBzgiQxkMTV75-+a27HE1juKSvitqjLrg3@mail.gmail.com>
References: <AANLkTikzpcKBzgiQxkMTV75-+a27HE1juKSvitqjLrg3@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 26 Feb 2011 16:37:12 -0700
X-Google-Sender-Auth: gdxpfRFSbO1okAbnG-k4lqcbwBs
Message-ID: <AANLkTikZPPi0j40cDv3tzJSWfJ-gnnrrrSCMO7ioz5eo@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Any good bitbake front-ends out there?
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
X-List-Received-Date: Sat, 26 Feb 2011 23:38:56 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 26, 2011 at 3:38 PM, Hans Henry von Tresckow
<hvontres@gmail.com> wrote:
> I was curious if anybody on the list has any recomendations for a
> bitbake front-end.

bitbake -u goggle foo # assuming bitbake 1.12.0 or newer
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


