Received: from [209.85.221.196] (helo=mail-qy0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1ME9Og-0001no-2t
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 00:02:22 +0200
Received: by qyk34 with SMTP id 34so467617qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jun 2009 14:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zrgfRPOUDQ9I7WvG9Q6AAzonk6spBsaLWYPEWMWlSxo=;
	b=MUgkC3zxFYc8jpA5wF41ueeGuGBkPIScnu1JwDGnv6J40vDPGSU0N10BaOmuF9+CTn
	DYWHpoPmgld6uWRGLG0bQLAHZKS05Eo3myzkGWKhySYw2eKBaI0p4uO+a2RZdiJgF7uR
	uz1Pt8PndZIUVPRHPzVDh87iduTc52YDUEy2o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fKEImHcHN9Zfwvi0t0/rn8fntyxddPLen1kEfW9drqxZ09nHo2vtsFoijQhngmOmFk
	sW2/XhGTtL5Ta0XzhfeaXZqaZRJC4fszg61TYvjAalWqNtjaicEK+vKhTdy/Mnx/eNDf
	jCZrZ4MRAU7Ns1UCjyYrJrJ+djVG3BXsAiUbQ=
MIME-Version: 1.0
Received: by 10.231.38.77 with SMTP id a13mr222196ibe.51.1244584362075; Tue, 
	09 Jun 2009 14:52:42 -0700 (PDT)
In-Reply-To: <1244582165.6677.3.camel@port4>
References: <f96d234e0906080759q40afd1dau930f93999048fbd9@mail.gmail.com>
	<200906081747.04528.marcin@juszkiewicz.com.pl>
	<1244582165.6677.3.camel@port4>
Date: Tue, 9 Jun 2009 23:52:42 +0200
Message-ID: <c384c5ea0906091452j441b50a2q60a66ef0ab87fdbd@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE weekly changelog 2009-06-01 to 2009-06-08
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
X-List-Received-Date: Tue, 09 Jun 2009 22:02:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Tue, Jun 9, 2009 at 11:16 PM, GNUtoo<GNUtoo@no-log.org> wrote:
> On Mon, 2009-06-08 at 17:46 +0200, Marcin Juszkiewicz wrote:
>> Maybe will also teach contributors to write shorter summaries ;)
> I often(but not always) write long summaries for giving info on why I
> did it this way to it's easier to maintain...
> So If it's better to write shorter summaries...where should I write the
> long version?
> Denis.
>
some-package: short description typically 76 chars or less

A longer description of the fix or feature this commit brings to
the OpenEmbedded community, and what it solves, how you
did it, what you would like people to read when they browse
through the commit logs.

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>

Regards,
-- 
Leon


