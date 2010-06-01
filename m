Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OJScL-0001l8-49
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 16:39:03 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 2AA0216607A4; Tue,  1 Jun 2010 08:34:44 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9E7DA16607A1;
	Tue,  1 Jun 2010 08:34:43 -0600 (MDT)
Message-ID: <4C051A83.6070601@mlbassoc.com>
Date: Tue, 01 Jun 2010 08:34:43 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C04F6FD.4070804@mlbassoc.com>
	<alpine.DEB.2.00.1006011021440.32142@lynx>
In-Reply-To: <alpine.DEB.2.00.1006011021440.32142@lynx>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: Is Angstrom dead?
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
X-List-Received-Date: Tue, 01 Jun 2010 14:39:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2010 08:24 AM, Robert P. J. Day wrote:
> On Tue, 1 Jun 2010, Gary Thomas wrote:
>
>> I tried again today, updating to org.openembedded.dev branch,
>> commit a2834c64fb3ed535fca51c25547754fa907e4ca5  Sadly, new
>> problems (and probably still the old ones) remain:
>>
>> | checking for CHEESE... configure: error: Package requirements (  glib-2.0>=
>> 2.16.0   gobject-2.0>= 2.12.0   gio-2.0>= 2.16.0   gtk+-2.0>= 2.19.1
>> gdk-2.0>= 2.14.0 gnome-desktop-2.0>= 2.26.0   gconf-2.0>= 2.16.0
>> gstreamer-0.10>= 0.10.23   gstreamer-plugins-base-0.10>= 0.10.23   cairo>=
>> 1.4.0   dbus-1>= 1.0   dbus-glib-1>= 0.7 pangocairo>= 1.18.0   librsvg-2.0
>>> = 2.18.0
>> |   libcanberra-gtk gudev-1.0) were not met:
>> |
>> | No package 'gstreamer-plugins-base-0.10' found
>> |
>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>> | installed software in a non-standard prefix.
>> |
>> | Alternatively, you may set the environment variables CHEESE_CFLAGS
>> | and CHEESE_LIBS to avoid the need to call pkg-config.
>> | See the pkg-config man page for more details.
>> |
>> NOTE: package cheese-2.30.1-r0: task do_configure: Failed
>
>    now i'm slightly confused since neither ubuntu or fedora appear to
> have any pkgconfig info for the cheese package, so why would there be
> a test for it that you would need to override?  or is this not
> pkgconfig-related?

I've no idea - all I was pointing out is that as of this morning,
there's a new failure...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


