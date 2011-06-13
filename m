Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QWCiW-00012J-Vk
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 21:22:33 +0200
Received: by qyk35 with SMTP id 35so1252373qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 12:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=KFT1Shh1VhjtD70vxBK6HkjqGg7IP7d18eERz7dJdO0=;
	b=IGC4VcMf5Hk+QVEHC8eHbljp+9EpRNxiiV0hpfKNQAEBdgXMdBBRBNp9U3bSkqQFte
	rQk1zobHbx3YXAr6YYGWSQl5HSzpw4z+nQ/kaxbjjxQGhmYsdAI8Mc8GciLt1+Luqbpw
	52areRuSYVAe4CT2FncHPOWjiOuQD+ADiqHTE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qeIC7ZnsXkZnCJXwV/lHBEg0F0QnQHf8Y+Gw4nJlCl74sg7PAwH0tajhr6zLY8VQ4p
	JaE67d0iYS2B+z3yQ4MamXWwJQNhgm/IrQcW5Ux5KrFe1HBPQ3xLPpO4m3RuawmnJdbm
	MMPhAYtW8o1xpk5HKF/LQmJWZcAR1/ax/JCEw=
MIME-Version: 1.0
Received: by 10.229.63.103 with SMTP id a39mr2225843qci.60.1307992747822; Mon,
	13 Jun 2011 12:19:07 -0700 (PDT)
Received: by 10.229.73.206 with HTTP; Mon, 13 Jun 2011 12:19:07 -0700 (PDT)
In-Reply-To: <BANLkTinVfs_kznrr9C9G2jtS516ud99Ltw@mail.gmail.com>
References: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
	<1307988638.4081.5.camel@mattotaupa>
	<BANLkTi=4kSE18LPqTyEgYRmZViJ4f+gGgw@mail.gmail.com>
	<BANLkTinVfs_kznrr9C9G2jtS516ud99Ltw@mail.gmail.com>
Date: Mon, 13 Jun 2011 21:19:07 +0200
Message-ID: <BANLkTinr27EvybkKQuG+i0ZWs6QthjxgcA@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] enjoy: add alsa and autodetect gst modules. Without autodetect, enjoy segfaults. Without alsa, no sound is played
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
X-List-Received-Date: Mon, 13 Jun 2011 19:22:33 -0000
Content-Type: text/plain; charset=UTF-8

Well I wouldn't say it's a problem itself.. it's just how emotion works...
it uses that gstreamer module so it's a needed dep in order to run ;)

-- 
Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

