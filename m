Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Ps8vA-0001WQ-EP
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 08:14:00 +0100
Received: by qyk27 with SMTP id 27so2479088qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 23:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=VUcthY7mx7J7B9PtCkSzIPV2jxYk4piB/glyfizV76E=;
	b=W+jVvVNnZxrngcMZP6uVxbE27oTfwTK35XuFbsHIHty5toqsbF2pU+7gmsBC6v4uuO
	U6T7e74+FyDxxayyc1zQ+q8DPTme9JTPUbUJ7yCHmIj0M1PhlxfFqMizpE9BCtJtar1I
	F+xyhYf4vLBJHdj7pN74jSQnx8kjWZjG541kQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UjCS2AuFpcJGL/nwYORxyxUgecg5W0gh8MWSy7c+dydjJrlQhZD5dFx49sn6202KG4
	lbT19k8KGVw/ad4kfGxCo0bW6HOVoE+6DXI7ld2wTlmlviD/FTd3M0hlQ9veVCd4MPIu
	qigkva4876bbaT0wlBn2GcdqOG4hTkOtNoXC8=
MIME-Version: 1.0
Received: by 10.229.241.194 with SMTP id lf2mr2707071qcb.222.1298445160264;
	Tue, 22 Feb 2011 23:12:40 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Tue, 22 Feb 2011 23:12:39 -0800 (PST)
In-Reply-To: <ik29om$8m7$1@dough.gmane.org>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<1297709209-6602-1-git-send-email-filip.zyzniewski@gmail.com>
	<ik29om$8m7$1@dough.gmane.org>
Date: Wed, 23 Feb 2011 08:12:39 +0100
Message-ID: <AANLkTimvzFij9bx0J8PbaWv1+_9TG4p4+vHPQH2DZnvV@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv2] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Wed, 23 Feb 2011 07:14:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/23/11, Koen Kooi <k.kooi@student.utwente.nl> wrote:

> The wl12xx files need to go into /lib/firmware, not
> /lib/firmware/ti-connectivity

This layout is copied verbatim from the linux-firmware git repository.
Maybe I'll just report it upstream?

bye,
Filip Zyzniewski


