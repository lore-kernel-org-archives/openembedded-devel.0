Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NB6Hq-0007W3-4S
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 13:39:01 +0100
Received: by fxm1 with SMTP id 1so2225176fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 04:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=efBiNxKTGpSAWlk73iV2JV9rydBgWLBm1Y8ArebJxjc=;
	b=sCwVguTq3PsNbW6/uM4HEw5tHcHp4hzHEMHBBOk7i3nO6mR61SFukDXgUQkzX2O7ol
	+CInVb1CEkZwiTqCpxnyXVY4VocvwYtc2E+BRB38zcTtBuWW3RiRuxR6kGVvmCEXanJa
	anZaaht2tC8NXqq3vPGmwSwRrDVUzQchpzcLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=G0tozZZswxr2mrAst+kL9XfRA8SYbdoRX/mbW1dZeloWgbm1k51YUggZbvKBwzpfRd
	XKHHAjo5wEO/1FdZdjATgnIRcPYTWXuIRNFreUddjMiXXGj81i6+nVMLJ4ibK4llygzM
	UElx87O5kclQmW62z70Rb9Nzmhfow+ZRJy1ms=
MIME-Version: 1.0
Received: by 10.239.160.75 with SMTP id b11mr590986hbd.178.1258634252878; Thu, 
	19 Nov 2009 04:37:32 -0800 (PST)
In-Reply-To: <he3dlo$8lb$1@ger.gmane.org>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
	<he3dlo$8lb$1@ger.gmane.org>
Date: Thu, 19 Nov 2009 13:37:32 +0100
Message-ID: <c384c5ea0911190437g302a68efx54f2d760990b4543@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 12:39:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Nov 19, 2009 at 1:28 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>
> It bothers me that everybody seems to have an opinion of stable/2009 but
> only very few people actually contribute to it. The OP is a great example of
>
It being stable is the greatest feature of the branch.

I think it's fine to contribute on a need-to-fix basis, only for its users.

There seems to be too much difference in perception when talking "stable".

Regards,
-- 
Leon


