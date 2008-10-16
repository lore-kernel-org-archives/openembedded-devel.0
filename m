Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KqZ6Q-0005s4-4f
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Oct 2008 22:05:48 +0200
Received: from hostdime.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 48767334EC9;
	Thu, 16 Oct 2008 17:05:40 -0300 (BRT)
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 7715D334E9D;
	Thu, 16 Oct 2008 17:05:37 -0300 (BRT)
Received: from mail.freedom.ind.br ([201.35.65.91] helo=mail.freedom.ind.br)
	by mail.freedom.ind.br; 16 Oct 2008 17:05:36 -0300
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id CFA608E0538;
	Thu, 16 Oct 2008 17:05:39 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 993718BD235;
	Thu, 16 Oct 2008 17:05:39 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 16 Oct 2008 17:05:39 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 30F2FC1EC;
	Thu, 16 Oct 2008 18:07:12 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id DCCE3610191; Thu, 16 Oct 2008 17:02:58 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1224184795.4235.133.camel@lenovo.internal.reciva.com>
	<gd8630$66f$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 16 Oct 2008 17:02:58 -0300
In-Reply-To: <gd8630$66f$1@ger.gmane.org> (Koen Kooi's message of "Thu\,
	16 Oct 2008 21\:53\:04 +0200")
Message-ID: <87fxmwqpe5.fsf@neumann.lab.ossystems.com.br>
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
X-List-Received-Date: Thu, 16 Oct 2008 20:05:57 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

>> Any objections?
>
> Yes. Recent xservers need hal for various input systems to work
> correctly. So instead of crippling the xserver you can keep a crippled
> version in your personal tree or overlay.

Fully support to keep hal as rdepends.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


