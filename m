Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <dp@xora.org.uk>) id 1H9nKY-0006Ls-DG
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jan 2007 19:58:46 +0100
Received: from xora.org.uk ([::ffff:85.210.190.44])
	(AUTH: LOGIN dp, TLS: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Wed, 24 Jan 2007 18:58:31 +0000
	id 00070013.45B7AC57.00002510
Date: Wed, 24 Jan 2007 19:03:05 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070124190305.GA4747@stygia.hyboria>
References: <E1H9l3p-0002C8-ES@linuxtogo.org>
Mime-Version: 1.0
In-Reply-To: <E1H9l3p-0002C8-ES@linuxtogo.org>
User-Agent: Mutt/1.5.12-2006-07-14
Subject: Re: [oe-commits] org.oe.dev pulse-audio: inherit pkgconfig and stage headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jan 2007 18:58:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jan 24, 2007 at 05:33:21PM +0100, koen commit wrote:
> pulse-audio: inherit pkgconfig and stage headers
> 
Because your not online, but pulseaudio just doesnt seem able
to supply esd.h or esound.pc which is required for esound apps.

Graeme



