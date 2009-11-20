Received: from ey-out-1920.google.com ([74.125.78.150])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NBUL9-000582-0f
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 15:20:02 +0100
Received: by ey-out-1920.google.com with SMTP id 3so347270eyh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 06:18:35 -0800 (PST)
Received: by 10.213.25.74 with SMTP id y10mr280058ebb.14.1258726714962;
	Fri, 20 Nov 2009 06:18:34 -0800 (PST)
Received: from localhost (lumison.wolfsonmicro.com [87.246.78.27])
	by mx.google.com with ESMTPS id 7sm392400eyb.42.2009.11.20.06.18.34
	(version=SSLv3 cipher=RC4-MD5); Fri, 20 Nov 2009 06:18:34 -0800 (PST)
Date: Fri, 20 Nov 2009 14:18:27 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091120141827.218e50be@xora.org.uk>
In-Reply-To: <he689r$c57$1@ger.gmane.org>
References: <he689r$c57$1@ger.gmane.org>
X-Mailer: Claws Mail 3.7.3 (GTK+ 2.18.3; i686-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 74.125.78.150
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: MACHINE_FEATURE changes
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
X-List-Received-Date: Fri, 20 Nov 2009 14:20:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2009 15:15:23 +0100
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> Hi,
> 
> Can someone please explain to me what
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=1bfa409a3a28cee60c4800d3caf33ce3f100d4ca
> 
> is trying to accomplish? It looks like this makes task-base unusable
> on om-gta0X, am I right?
> 

Haven't done a build, but I think it means nothing other than FSO
based distros can suspend on gta01/02.

Graeme


