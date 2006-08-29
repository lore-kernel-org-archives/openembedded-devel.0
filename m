Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GHsGy-0007vP-T8
	for openembedded-devel@openembedded.org; Tue, 29 Aug 2006 03:20:13 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 6C162AD92C;
	Tue, 29 Aug 2006 11:18:10 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18854-02; Tue, 29 Aug 2006 11:18:08 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 636C5AD91F;
	Tue, 29 Aug 2006 11:18:08 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 562EBF35144; Tue, 29 Aug 2006 11:18:08 +1000 (EST)
Date: Tue, 29 Aug 2006 11:18:08 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@openembedded.org
Message-ID: <20060829011808.GB31668@twibble.org>
References: <E1GGZOX-0002WU-1s@linuxtogo.org>
	<20060827233927.GA9807@twibble.org>
	<200608281147.01329.openembedded@hrw.one.pl>
	<20060829011415.GA31668@twibble.org>
Mime-Version: 1.0
In-Reply-To: <20060829011415.GA31668@twibble.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: Section list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2006 01:20:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Updated list, including your changes.

These sections are to be changed:

    * applications		-> Replace with appropriate section
    * apps			-> Replace with appropriate section
    * bootloader		-> Replace with bootloaders
    * console/shells		-> Replace with base/shell
    * console/net		-> Replace with console/network
    * console/networking	-> Replace with console/network
    * console/util		-> Replace with console/utils
    * dev-lang			-> Replace with devel
    * gnome/libs		-> Replace with x11/libs?
    * gnome/multimedia		-> Replace with x11/multimedia?
    * gui			-> Replace with appropriate section
    * kernel/module		-> Replace with kernel/modules
    * kde/dev			-> Replace with kde/devel
    * libs/inputmethod		-> Replace with libs/inputmethods
    * media-gfx			-> Replace with appropriate section
    * multimedia		-> Replace with appropriate section
    * net			-> Replace with network
    * net-misc			-> Replace with network/misc
    * net/misc			-> Replace with nerwork/misc
    * opie/Shell		-> Replace with opie/shell
    * unknown			-> Replace with appropriate section
    * utility			-> Replace with utils
    * x11-misc			-> Replace with appropriate section
    * x11/gnome			-> Replace with x11?
    * x11/gnome/libs		-> Replace with x11/libs?

That leaves us with these as the available sections:

    * admin
    * base
    * base/shell
    * bootloaders		-> NEW, replaces bootloader
    * console
    * console/editors
    * console/games
    * console/multimedia
    * console/network
    * console/scientific
    * console/telephony
    * console/tools
    * console/utils
    * devel
    * devel/libs
    * devel/perl		-> NEW
    * devel/python
    * devel/rexx
    * devel/ruby
    * devel/scheme		-> I missed this one before
    * devel/tcltk
    * doc
    * e/apps
    * e/libs
    * e/utils
    * fonts			-> NEW, for fonts that are not X11 or OPIE specific (truetype for exmaple)
    * games
    * games/arcade
    * gpe
    * gpe/applications
    * gpe/base
    * gpe/games
    * gpe/libs
    * gpe/multimedia
    * interpreters
    * kde
    * kde/devel			-> NEW, replaces kde/dev
    * kernel
    * kernel/modules
    * kernel/userland
    * libs
    * libs/inputmethods
    * libs/multimedia
    * libs/network
    * network
    * network/cms
    * network/misc
    * opie
    * opie/applets
    * opie/applications
    * opie/base
    * opie/codecs
    * opie/datebook
    * opie/decorations
    * opie/fontfactories
    * opie/fonts
    * opie/games
    * opie/help
    * opie/inputmethods
    * opie/libs
    * opie/multimedia
    * opie/network
    * opie/pim
    * opie/security
    * opie/settings
    * opie/shell
    * opie/styles
    * opie/today
    * utils
    * x11
    * x11/apps			-> Really should be x11/applications and probably should go somewhere else
    * x11/base
    * x11/data
    * x11/fonts
    * x11/games
    * x11/graphics
    * x11/libs
    * x11/multimedia
    * x11/network
    * x11/office
    * x11/scientific
    * x11/utils
    * x11/wm 

-- 
 Jamie Lenehan <lenehan@twibble.org>


