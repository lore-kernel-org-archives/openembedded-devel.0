Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OTCNo-0003cU-Nz
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 13:20:13 +0200
Received: (qmail invoked by alias); 28 Jun 2010 11:15:30 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp050) with SMTP; 28 Jun 2010 13:15:30 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/f3N9v2e3f3Jww3/M7QSOvmNkEQNqklgD8DR0pUV
	KJ829fGB5wryUq
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jun 2010 13:12:29 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201006250901.38077.schnitzeltony@gmx.de>
	<i0220d$htp$1@dough.gmane.org> <1277713404.29314.3248.camel@rex>
In-Reply-To: <1277713404.29314.3248.camel@rex>
MIME-Version: 1.0
Message-Id: <201006281312.29871.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: MeeGo support in OE
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
X-List-Received-Date: Mon, 28 Jun 2010 11:20:14 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 28 June 2010 10:23:24 am Richard Purdie wrote:
> On Fri, 2010-06-25 at 12:56 +0200, Koen Kooi wrote:
> > On 25-06-10 09:01, Andreas Mueller wrote:
> > > My investigations for a 'colorful' embedded environment lead me to Meego (http://meego.com/).
> > > 
> > > On the webpage we learn that this is a platform independent environment but there are only few platforms supported (Nokia N900 / Beaglebord / few Intel netbooks).
> > > 
> > > To have full platform-independency I would like to have Meego (maybe parts of it only) within OE and started already with easiest part uxlaunch (very tiny dm - see 
> > > git://gitorious.org/meego-os-base/uxlaunch.git). This is already tested with xfce environment but before posting a patch here I would like to do some further tests with 
gnome/enlightenment and 
> > > see what happens in case another dm is found in the image. 
> > > 
> > > Next step planned is mutter. Here I would like to use the original gnome sources and check the diffs to meego branch.
> > > 
> > > Now my questions:
> > > 
> > > - Are there any objections including meego parts (licensing / don't like Intel/Nokia..) in OE
> > > - Are there already proceedings related to mutter ongoing? Or is there a reason that mutter is not in OE other than nobody has done so far?
> > 
> > I didn't add mutter because at the time it didn't build against
> > clutter/gles. It think that has changed now :)
> > 
> > I would very much like to build meego components in OE!
> 
> You could do worse than look at meta-moblin in Poky which has recipes
> for some components like mutter.
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

Thanks for the information - I will take a look on poky but right now I dived into bumping versions of clutter...

Andreas


