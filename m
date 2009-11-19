Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NB6JC-0007dm-C2
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 13:40:25 +0100
Received: by bwz9 with SMTP id 9so2224896bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 04:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=BZzWdlgQqQ4Fv5Gcdu5ukDYGbyFWZzt4FQrdMP2ked0=;
	b=wXbbc8uGnalLN4kzEjEV6vEt79m70elllG9cETuScAzUdPUY1QNDMJyWfBqVEcnKJo
	1pFTuw3daSHuC9cO+XkrqdOaRxeywiuLDe/Gler6qZ2Hg0jF7aXX9iu2ObsWxmIhP391
	ZU9eo8JO2lJjDlzUDm3/xl9AI5C6PXkPryCNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tCgDhQScOt+ubM7qswrNmCzqFHo40G6N0GJHe4XYOpbaz6ipAAf/PFFEtL54QOQl2h
	41ZieXTCdQpTrA+aP/g0SMxMMN4ZDP+ff7oQyiJ+qbJ9i1+BA84Eq04AFPsOgHk7mUQm
	AfaH42XwQtX3uDg4FrJ0dcXiaERwtmKeAXKkI=
MIME-Version: 1.0
Received: by 10.239.179.101 with SMTP id c37mr88094hbg.4.1258634337151; Thu, 
	19 Nov 2009 04:38:57 -0800 (PST)
In-Reply-To: <818ccfc40911182327t686578acn565645806bcf280e@mail.gmail.com>
References: <818ccfc40911182327t686578acn565645806bcf280e@mail.gmail.com>
Date: Thu, 19 Nov 2009 13:38:56 +0100
Message-ID: <c384c5ea0911190438l6e351ad0i97a798890ba152d4@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: do staging failed while building eglibc
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
X-List-Received-Date: Thu, 19 Nov 2009 12:40:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Ahsan,

On Thu, Nov 19, 2009 at 8:27 AM, Ahsan Khawaja <ahsan.khwaja@gmail.com> wrote:
>
> i am using openembedded to build my develoment system for bare metal. I
> changed the TARGET _OS to arm-none-eabi. while building the system the
> eglibc gets error during staging process. Error description is to confusing.
> Please help me in resolving this issue.
>
For what machine and/or architecture?

Regards,
-- 
Leon


