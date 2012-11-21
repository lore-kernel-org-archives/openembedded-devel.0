Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TbAJ6-0007iD-Cm
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 14:25:43 +0100
Received: (qmail 1905 invoked by uid 1003); 21 Nov 2012 13:11:31 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.166.19)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	21 Nov 2012 13:11:31 -0000
Message-ID: <50ACD301.9000109@balister.org>
Date: Wed, 21 Nov 2012 08:11:29 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <k6b5r8$edu$1@ger.gmane.org>
In-Reply-To: <k6b5r8$edu$1@ger.gmane.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: yocto 1.3 branch for meta-openembedded layers, RFC wanted.
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
X-List-Received-Date: Wed, 21 Nov 2012 13:25:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/2012 06:55 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> We need a branch to track oe-core 'danny' and I am swamped till ELC-E
> happens, so I would like to hold off on patches that make meta-oe layers
> incompatible with oe-core 'danny'.
>
> As for branch maintenance: any volunteers for managing the meta-openembedded
> 'danny' branches? There doesn't need to be a single maintainer, but it would
> be nice to have one person coordinating everything, even if it's just
> pulling in danny-next branches from the layer maintainers every week or so.
>
> As I said above, I'm swamped for the next 3 weeks, so can people who have
> used or are using the 'denzil' branch weigh in with feedback/anecdotes/etc?
> I have such a document for oe-core 'denzil', which I keep failing to send
> out, but it boils down to "better predictability for merge windows". Please
> share your experience for meta-oe here.

What is happening on this front? Since oe-core dropp qt-4.8.1, builds 
including meta-oe are now broken.

If the branch maintainers are not ready to go, we need to apply patches 
that fix builds, even if thy break compatibility with Danny.

Philip

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQiRqzMkyGM64RGpERAschAJ98yscNYLI9qNGRviDm+drBquLttACgoa0X
> /YhGdFr+iYLy8n99sXb4zKE=
> =ahtL
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


