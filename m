Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1K5nn3-00081L-K0
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jun 2008 22:16:29 +0200
Received: from xora.org.uk ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Mon, 09 Jun 2008 21:11:12 +0100
	id 0007110D.484D8E60.00003495
Date: Mon, 9 Jun 2008 21:11:10 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080609201110.GA2975@aesgaard.hyboria>
References: <200806061706.11880.geoffrey@pager.net>
	<20080606222450.GA6145@rhein.zuhause.netz>
	<200806071231.54955.geoffrey@pager.net>
	<200806091432.37869.geoffrey@pager.net>
Mime-Version: 1.0
In-Reply-To: <200806091432.37869.geoffrey@pager.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: DEPENDS="gettext" vs. DEPENDS="virtual/libintl"
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
X-List-Received-Date: Mon, 09 Jun 2008 20:16:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 09, 2008 at 02:32:37PM -0500, Geoffrey Wossum wrote:
> It works!  I got rid of gettext.  It didn't fix all my problems, but it fixed 
> crashes with aplay and Xfbdev.  avahi still crashes, must be a separate 
> issue...
> 
avahi segfaults if you dont have a /etc/resolv.conf which a lot of
machines dont by default.

G



