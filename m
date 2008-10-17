Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1Kqo2D-0007ry-CB
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 14:02:25 +0200
Received: from hostdime.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id E0E0F334FE0;
	Fri, 17 Oct 2008 09:02:17 -0300 (BRT)
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id C9C8F334FA8;
	Fri, 17 Oct 2008 09:02:16 -0300 (BRT)
Received: from mail.freedom.ind.br ([201.35.65.91] helo=mail.freedom.ind.br)
	by mail.freedom.ind.br; 17 Oct 2008 09:02:15 -0300
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 7BAFB8E26FF;
	Fri, 17 Oct 2008 09:02:15 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 4CCD98E26F3;
	Fri, 17 Oct 2008 09:02:15 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 17 Oct 2008 09:02:15 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 3460FC2E3;
	Fri, 17 Oct 2008 10:03:53 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 5DC1E610191; Fri, 17 Oct 2008 08:59:36 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1224184795.4235.133.camel@lenovo.internal.reciva.com>
	<gd8630$66f$1@ger.gmane.org>
	<87fxmwqpe5.fsf@neumann.lab.ossystems.com.br>
	<1224233468.30790.125.camel@mill.internal.reciva.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Fri, 17 Oct 2008 08:59:36 -0300
In-Reply-To: <1224233468.30790.125.camel@mill.internal.reciva.com> (Phil
	Blundell's message of "Fri\, 17 Oct 2008 09\:51\:08 +0100")
Message-ID: <871vyfph3r.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: xserver-xorg rdepends
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
X-List-Received-Date: Fri, 17 Oct 2008 12:02:26 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <pb@reciva.com> writes:

> On Thu, 2008-10-16 at 17:02 -0300, Otavio Salvador wrote:
>> Koen Kooi <k.kooi@student.utwente.nl> writes:
>> 
>> >> Any objections?
>> >
>> > Yes. Recent xservers need hal for various input systems to work
>> > correctly. So instead of crippling the xserver you can keep a crippled
>> > version in your personal tree or overlay.
>> 
>> Fully support to keep hal as rdepends.
>
> This seems like an odd point of view.  There are various other things
> that the xserver requires for full operation (fonts, video drivers and
> other modules for example), none of which are listed in RDEPENDS.  It
> isn't obvious to me that hal is any more important than those.

Point taken!

Yes your argument changed my mind and I support the removal. This
looks more logical to use same criterion for those packages.

+1

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


