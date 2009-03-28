Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1LngVa-000535-Jk; Sat, 28 Mar 2009 22:56:06 +0100
Received: from 89-168-150-245.dynamic.dsl.as9105.com ([89.168.150.245]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1LngTg-0002b0-7m; Sat, 28 Mar 2009 21:54:08 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090328211530.7700adb1@mail.villafam.com>
References: <20090328211530.7700adb1@mail.villafam.com>
Date: Sat, 28 Mar 2009 21:54:06 +0000
Message-Id: <1238277247.30429.11.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: TinyLogin
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
X-List-Received-Date: Sat, 28 Mar 2009 21:56:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-03-28 at 17:15 -0400, Juan C. Villa wrote:
> Hey guys,
> 
> I deleted my local download cache yesterday and I have not been able to rebuild my distro with OpenEmbedded because the TinyLogin (http://tinylogin.busybox.net/) program got merged into BusyBox. 
> 
> recipes/tinylogin/tinylogin_1.4.bb  needs to be updated.

Yes, it seems the crazy busybox dudes have removed the old tinylogin
sources.  That's a bit of a pain.

Are there any mirrors where the files are still available?

p.




