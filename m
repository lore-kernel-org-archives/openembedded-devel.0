Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6lnp-0002bL-WA
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 19:11:42 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 09:59:27 -0700
Received: by obblz20 with SMTP id lz20so1471193obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 09:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=PohQwsI0sv/FepykYcY8OI0N0MnQ94fWO0NpSD3vOUM=;
	b=LWV1QyTO0L1mhJBmNirXRxriIejxFG7wTpwebQNDLrE00Gh1jPH3gpP2y22uoUZwNg
	y01P86zQNczFeGd1+N97qmeYxB7E6iMeckpqFYz+o3Jfra54PDV/VHDdbBmgtlEq7LrH
	2JPrmpYfOlpkyAfyyMvM8xsMWDV5GdGQqZTxZ7kUyp64KLlpm49OTtEcAsrjw76ixY2Z
	NNk7r8d0jz0N0KjKysrP3VTwUxcZkeJ/n2lpdbkOj/DVlDmRQHe5nL1Gcc4lilCgPiSt
	ArzOakKhhBdOGkXc3Si2Dl+919HxhOeqkvaSuNQygr8GEl1pydv8p92zjqAKIhuHgWjT
	WNig==
Received: by 10.60.29.229 with SMTP id n5mr1878054oeh.103.1346259566417; Wed,
	29 Aug 2012 09:59:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 29 Aug 2012 09:59:06 -0700 (PDT)
In-Reply-To: <k1lhde$fdj$1@ger.gmane.org>
References: <1346247150-17236-1-git-send-email-ross.burton@intel.com>
	<3DA568F2-7691-4344-904C-7DB6FFBF90B9@gmail.com>
	<CAJTo0LYGOrwT1BwB8gDmGwMr67v8Mhtci8MK_QdHm9AW7EeDFA@mail.gmail.com>
	<k1lhde$fdj$1@ger.gmane.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Aug 2012 17:59:06 +0100
Message-ID: <CAJTo0LbHYmWbomXPCWoc_q-Z+m0WvWZ6Aq1my190P7qdx=GPOg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnzJOxqA5Zc+xUBq9DzyAX/G2hX0E3a43Y9blwpPnaBfSlltWwzUnHo4gqE0KN3L9OqZH+s
Subject: Re: [PATCH] pimlico: remove Poky overrides
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
X-List-Received-Date: Wed, 29 Aug 2012 17:11:42 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2012 17:53, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Either take the distro stuff out or take the recipes out. Meta-openembedded
> is supposed to be a shining example of layer correctness.

I don't particularly want to maintain bbappends in meta-yocto for
these as I'd prefer to see the recipes (well, contacts and dates, I
still "maintain" tasks) gone.

Ross


