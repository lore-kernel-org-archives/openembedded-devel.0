Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LcK8R-0007Tw-1Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 14:49:15 +0100
Received: by rv-out-0708.google.com with SMTP id b17so27686rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 05:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ioM1cInXXw4Bzm/fQmJrsTsjuEXg5GKASTC+WncC7X0=;
	b=HKBXFXTOB6kUfNQF2lwHjLbwX6woUENzrDsvqHkm2b4prsYfxpQ7gz6veDUjHo8LVP
	2b9wJsb2I33inwRtYQkGDqa6xpYehy0y8WXTMsCO9UbfC267+IoaP2pnp4whxTzNAgOU
	yrrWYe99gM6xb0Z34URrRixSYYqoYlqzUN/wA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=S9aWwZSqHqUFJcU8p4tofwZMZFm5UtdGuJJ/82a5nsDUxlDUlXuWB41wi6YUP582ow
	TOQ83lXhB+X9UR45zGZKhzpzpNZz+dh5apAQGXIHOwDbwkXJpSTOyMlkNlr4gh++JNMS
	R4SMDZGnPWORbuj1YIQrhMQcQmgIlRKsJLYnI=
MIME-Version: 1.0
Received: by 10.141.155.15 with SMTP id h15mr61752rvo.158.1235569565061; Wed, 
	25 Feb 2009 05:46:05 -0800 (PST)
In-Reply-To: <alpine.DEB.1.00.0902241833540.19556@localhost.localdomain>
References: <alpine.DEB.1.00.0902241833540.19556@localhost.localdomain>
Date: Wed, 25 Feb 2009 08:46:05 -0500
Message-ID: <f96d234e0902250546p20c42734r9583d40ab0ef125f@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] getting_oe.xml: Add Configuring OpenEmbedded section.
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
X-List-Received-Date: Wed, 25 Feb 2009 13:49:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, Feb 24, 2009 at 9:35 PM, Theodore A. Roth <taroth@gmail.com> wrote:
> This patch fills in the stub for the "Configuring OpenEmbedded" section.
>
> Signed-off-by: Theodore A. Roth <taroth@gmail.com>

Pushed, thanks!

-- 
=======================
Cliff Brake
http://bec-systems.com


