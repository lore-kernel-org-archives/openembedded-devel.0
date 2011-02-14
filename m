Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pp2mf-0003LP-30
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 19:04:25 +0100
Received: by qwi2 with SMTP id 2so3153944qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 10:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=9sAhWet+dK/3kds6zzeGN0B0jSbr+9YNvT+vHJECHlc=;
	b=FIZhj5uEOnU7Glb/qVDJN3mYFfvPP0CA/6pnN0VVy9JoI1afhBUSrrkNlgNxY8qnef
	d8W/bDPVGMxJVZ6rNA7EKblxh6ltS2k9LAfVVkfBCRTC4FmANdBJbzqs+ucoIMnE1P7u
	eU2vGxAoxgpTNonWPj35WDsuIPPqy/VvDCF1I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FMqyqlx0v3uQHs0d5M5c8autj/LF6RpFlucwN2mwAOJZVGZmwVDfACLRzo0D37gwvE
	CUidjWk+rQ59NtyFR30Z30kJ2C9AlIbxmCQdUIMqMtWJeg/8MBGvA4u3lCHq+bEh4vER
	enbzaizLnYeGTrXcXDW5Pst6dQ3BQFk5kfDOk=
MIME-Version: 1.0
Received: by 10.224.74.1 with SMTP id s1mr3557160qaj.34.1297706594273; Mon, 14
	Feb 2011 10:03:14 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Mon, 14 Feb 2011 10:03:14 -0800 (PST)
In-Reply-To: <1297706490-6486-1-git-send-email-filip.zyzniewski@gmail.com>
References: <AANLkTinXm+YcGS_uadbA6ddezRRtZB0r6Tqcgt7GyOh4@mail.gmail.com>
	<1297706490-6486-1-git-send-email-filip.zyzniewski@gmail.com>
Date: Mon, 14 Feb 2011 19:03:14 +0100
Message-ID: <AANLkTin+F3UcPTwQX+oN4j3z7i6xaLQkbTR3cDm5T_0p@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv2] image.bbclass: move insert_feed_uris() to rootfs_ipk.bbclass
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
X-List-Received-Date: Mon, 14 Feb 2011 18:04:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/14/11, Filip Zyzniewski <filip.zyzniewski@gmail.com> wrote:
> This function generates feed configuration for opkg and as such
> should be used only for images using ipk, not rpm or deb.

Uh, sorry, this wasn't supposed to land here :).

bye,
Filip Zyzniewski


