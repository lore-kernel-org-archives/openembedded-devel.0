Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MGDsa-0006v7-Ll
	for openembedded-devel@openembedded.org; Mon, 15 Jun 2009 17:13:48 +0200
Received: by qw-out-1920.google.com with SMTP id 4so2211688qwk.6
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Jun 2009 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=LZEXj3+WpzYRQF8re5oD0ZkTNhSOBx8D91bHyy/tgQo=;
	b=lfOUXe0DRa4dJ0mRY628aBbUDb/qKz6uXDb95+bS9vbvUO8P+h5uGzSOwrFab72x2P
	9a2IeYknPRr8UE3OYWiuX0+d6erTzbbetmcb9eBO7EV+DL5xUIkyNWNwHT3ikZ96An0B
	1ozsq7Wq4lj/tyhY6oPksrW6nA1WMaNzBirj0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=SBs/b99/5xCTgRV2KK0SZxBuCooszYZEbw8adIL5fEOEIzAEnXEjMpy0gXdO+Zljua
	PeZS/z/5ntRwe15naV8a5GyxTd0qvoD4ufEwX0fB39sZ9eUmye0XSbwdTwPSYqDGY+Qy
	y7SHcFqSLPfsrLNk2z5pfPLWlDgQ8Uog5fNLU=
MIME-Version: 1.0
Received: by 10.231.11.139 with SMTP id t11mr2526029ibt.25.1245078214856; Mon, 
	15 Jun 2009 08:03:34 -0700 (PDT)
In-Reply-To: <4A365C10.8020307@mta.it>
References: <4A365C10.8020307@mta.it>
Date: Mon, 15 Jun 2009 17:03:34 +0200
Message-ID: <c384c5ea0906150803v223fc517se185b7fbe8a4859e@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Subject: Re: nof/libgcc_s.so installed instead of libgcc_s.so on powerpc
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
X-List-Received-Date: Mon, 15 Jun 2009 15:13:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Matteo,

On Mon, Jun 15, 2009 at 4:34 PM, Matteo Fortini<matteo.fortini@mta.it> wrote:
> I'm building the Angstrom console-image on a powerpc (mpc5121) with
> stable/2009.
>
Just to be sure: You are building OpenEmbedded *on* a MPC5121 platform?

For what machine are you building?

Regards,

Leon.


