Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KDlEQ-0005ik-Ln
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jul 2008 21:09:39 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 89F6C19D17C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2008 16:06:32 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 5F20B16D9B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2008 16:06:32 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 1 Jul 2008 16:06:32 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 02F74C255
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2008 13:06:40 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 66769610047; Tue,  1 Jul 2008 16:06:29 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <877ic6srbf.fsf@neumann.lab.ossystems.com.br>
	<1214853946.21138.8.camel@lenovo.internal.reciva.com>
	<87zlp2elny.fsf@neumann.lab.ossystems.com.br>
	<1214858808.21138.20.camel@lenovo.internal.reciva.com>
	<87r6aeabjb.fsf@neumann.lab.ossystems.com.br>
	<1214861173.21138.24.camel@lenovo.internal.reciva.com>
	<87od5i8urj.fsf@neumann.lab.ossystems.com.br>
	<1214862651.21138.26.camel@lenovo.internal.reciva.com>
	<871w2djwme.fsf@neumann.lab.ossystems.com.br>
	<1214937507.21138.31.camel@lenovo.internal.reciva.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Tue, 01 Jul 2008 16:06:29 -0300
In-Reply-To: <1214937507.21138.31.camel@lenovo.internal.reciva.com> (Phil
	Blundell's message of "Tue\, 01 Jul 2008 19\:38\:27 +0100")
Message-ID: <87wsk5h1ai.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: Problem with i18n (input)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 01 Jul 2008 19:09:39 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <pb@reciva.com> writes:

> On Tue, 2008-07-01 at 15:19 -0300, Otavio Salvador wrote:
>> Phil Blundell <pb@reciva.com> writes:
>> 
>> > On Mon, 2008-06-30 at 18:42 -0300, Otavio Salvador wrote:
>> >> I've tryed it on both, a regular Debian system and it does load the
>> >> Compose file. At OE image, it does not.
>> >
>> > Is it even loading compose.dir on your OE image?
>> 
>> It's not.
>
> Hum.  How about locale.dir, does it load that one?

It does.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


