Received: from [192.132.34.13] (helo=amail.unina.it)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <ranaldo@unina.it>) id 1HQkJ1-0001Tb-A9
	for openembedded-devel@openembedded.org; Mon, 12 Mar 2007 14:11:16 +0100
Received: from blaster.unina.it ([192.132.34.15]) (authenticated bits=0)
	by amail.unina.it (8.13.4/8.13.4) with ESMTP id l2CDBEd4030881
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 12 Mar 2007 14:11:14 +0100
From: Nicola Ranaldo <ranaldo@unina.it>
To: openembedded-devel@openembedded.org, openembedded-devel@openembedded.org
Date: Mon, 12 Mar 2007 14:09:48 +0100
User-Agent: KMail/1.9.6
References: <1173049360.27812@gatekeeper.stellarwerx.com>
In-Reply-To: <1173049360.27812@gatekeeper.stellarwerx.com>
MIME-Version: 1.0
Message-Id: <200703121409.49063.ranaldo@unina.it>
Subject: Re: Fixing QA Errors?
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
X-List-Received-Date: Mon, 12 Mar 2007 13:11:16 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 05 March 2007 00:02:41 Mark Gollahon wrote:
> Koen:
>
> I've tried several different combinations for the FILES_ stuff, but I am
> still getting both errors.  Since the errors show up when QA checking the
> libqtaux2 package (as opposed to checking the *-dev, *-doc, etc.,
> packages), could this be more of a problem of the files not getting
> installed to the right place, or is that what the FILES_* spec is supposed
> to do?

Try putting thos lines *before* the others.
This worked for me on librsvg.

Howewer is it planned to fix all the qa issues on the repository or have we to 
open a bug for every qa related question?

	Niko


