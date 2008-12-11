Received: from [74.125.78.149] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LAmf6-0000cK-49
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 15:37:08 +0100
Received: by ey-out-1920.google.com with SMTP id 4so145902eyg.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 06:33:03 -0800 (PST)
Received: by 10.210.10.1 with SMTP id 1mr3290690ebj.8.1229005982733;
	Thu, 11 Dec 2008 06:33:02 -0800 (PST)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id f13sm1041006gvd.8.2008.12.11.06.33.01
	(version=SSLv3 cipher=RC4-MD5); Thu, 11 Dec 2008 06:33:01 -0800 (PST)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081211135514.GE9378@excalibur.local>
References: <20081210234910.GA16050@excalibur.local>
	<49405BD7.2010801@gmx.de> <ghqjue$4fe$1@ger.gmane.org>
	<d1b08f940812110137g3369f156rfff59659b48b788f@mail.gmail.com>
	<20081211132221.GA9378@excalibur.local>
	<1229002720.7018.0.camel@aquilonia>
	<20081211135514.GE9378@excalibur.local>
Date: Thu, 11 Dec 2008 14:33:00 +0000
Message-Id: <1229005980.7018.1.camel@aquilonia>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.2 
Subject: Re: [RFC] Ship dbus config and dbus service activation files
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
X-List-Received-Date: Thu, 11 Dec 2008 14:37:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-12-11 at 14:55 +0100, Stefan Schmidt wrote:
> Hello.
> 
> On Thu, 2008-12-11 at 13:38, Graeme Gregory wrote:
> > On Thu, 2008-12-11 at 14:22 +0100, Stefan Schmidt wrote:
> > > 
> > > On Thu, 2008-12-11 at 10:37, Andrea Adami wrote:
> > > > About connman, last time I built it I noticed it depends on
> > > > 'resolvconf' which depends on 'bash'.
> > > > 
> > > > Is it right?
> > > 
> > > I don't remember if it was resolvconf or if it was dhclient, but one of it
> > > pulled in bash. This may indeed be worth trying out the alternative Koen pointed
> > > out.
> > > 
> > dhclient certainly used to use a script full of bashisms called when the
> > IP address is discovered. I had fun patching that one for NetworkManager
> 
> Interesting. Your fixes are in OE.dev already?
> 
> I also got a pointer that maybe udhcp be worth looking into. Would need me to
> look into a plugin for it. Still this has to wait until I got the basic
> functions up and running.
> 
Yes, I used to use NetworkManager on my zaurus to manage the wifi!

Graeme




