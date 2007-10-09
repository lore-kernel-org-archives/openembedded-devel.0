Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1IfDC1-0000Kv-LE
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2007 13:24:05 +0200
Received: from aquilonia ([::ffff:62.220.14.162])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 09 Oct 2007 12:18:18 +0100
	id 0006404B.470B637A.00005497
Date: Tue, 9 Oct 2007 13:18:12 +0200
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071009131812.0f55c4d2@aquilonia>
In-Reply-To: <1191926182.20582.22.camel@localhost.localdomain>
References: <1191494488.2516.34.camel@toontown>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown>
	<EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
	<D61182AC8012EA4EBC531B3AF23BE10947F630@tranzeo-mail2.12stewart.tranzeo.com>
	<4704F01B.70104@klever.net> <4705D99D.6070209@miromico.ch>
	<f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
	<f96d234e0710081320s567bf1bfie56eebca83afb6b2@mail.gmail.com>
	<1191918523.470b3bbb10a47@dominion.kabel.utwente.nl>
	<74d0deb30710090202i61cdd25n22f3519ebfd9147a@mail.gmail.com>
	<1191926182.20582.22.camel@localhost.localdomain>
X-Mailer: Claws Mail 3.0.1 (GTK+ 2.10.11; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: oe for two target boards at the same time
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
X-List-Received-Date: Tue, 09 Oct 2007 11:24:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 09 Oct 2007 12:36:22 +0200
Richard Purdie <rpurdie@rpsys.net> wrote:
> The issue should be fixed. I regularly make builds with a MACHINE ?=
> entry but with MACHINE set in the environment too and it all seems to
> work.
> 
> People keep telling me there is a problem but I've not seen any
> reproducible test case...
> 

NOTE: package binutils-cross-2.18-r0: task do_populate_staging:
completed

looks fixed to me, I never used to be able to do this.

Graeme


