Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Lcga0-0002Ap-5y
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 14:47:23 +0100
Received: by yx-out-1718.google.com with SMTP id 36so373187yxh.30
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Feb 2009 05:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=tSSBnTFKrAhskuHyO9O8Q/OgmA7CSZ/8WU2V38ntQeE=;
	b=QOT3CkIKp2D+t53DNprXmiGULG7Ac443TlO1bXQj5ROq0T9Zu+iY2SK/i9NVVODMMX
	3qHf2PvquoFGf8VCwrMktJg0pNQOjMr9srqQIgK2fFYW2x2fLgEYABHSy7kNKu/P9nUY
	PWEe+1o0oXN3nVAuq5MdzcGReOZU/apyrT0tw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Luth3dZNBl9A+SnXjlMBr6IdGHoEb/fRNztXdkzKgzF7PN4eju1eahemeBIMLtsQ3n
	usWoJi+rvixsgN6PQpkSbzA8dQL5RAp7m0y/CRcx79xEK2z0QJPL8Pa64Ug823pOOthQ
	kFFiO7bypU3uraDVesxz5n1QgfaOEQTH9W9O0=
MIME-Version: 1.0
Received: by 10.220.85.130 with SMTP id o2mr597037vcl.80.1235655833100; Thu, 
	26 Feb 2009 05:43:53 -0800 (PST)
In-Reply-To: <go498c$bqq$1@ger.gmane.org>
References: <go498c$bqq$1@ger.gmane.org>
Date: Thu, 26 Feb 2009 14:43:53 +0100
Message-ID: <c384c5ea0902260543y32a770c7nb1e2510780df1c8a@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Thu, 26 Feb 2009 13:47:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Wed, Feb 25, 2009 at 9:21 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> mv packages recipes ; git commit .
>
if (i < MAX_INT) i++;

Regards,
-- 
Leon


