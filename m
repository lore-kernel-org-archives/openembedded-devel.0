Received: from [64.233.170.186] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1KqoB7-0008NC-9o
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 14:11:37 +0200
Received: by rn-out-0910.google.com with SMTP id j66so202854rne.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2008 05:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=4QQMzXo8v9P0gk5mZ1RBi4QzaNshUW5EUih6G4Sxh1k=;
	b=AoOVM5bK/7P+bPfblYlIEdGTJEF1JdaJvMbuAvRgEZ+45KxfFidWU9pXV3y2vmCaey
	EkoVNEp0VP4P+efOfCNo0kOxc43dGsDzUuEM8AQdOo8bnfX77i3GBWjBLTuQrAogJlFX
	lw5gfcNZBvmckK1b5AOuV78/jG6PKgObZ+Lak=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=MkTQZeIwmXPF/6ipyPVdByRF5p6R3fqClfksV6g3NF5x6YzWpx/h7JQftN39KeG3CH
	tPjjU4toMyVFQ980GRU7JA6rVX7gocGq7Qmhbnzs+h3dKr0/phAyHMP3dD7NA2aOQ3ZD
	TxHx5qj8ZEtOp+3ZWmIzvfigDtHgE1v4vFdN0=
Received: by 10.100.96.9 with SMTP id t9mr5052003anb.109.1224245491918;
	Fri, 17 Oct 2008 05:11:31 -0700 (PDT)
Received: by 10.100.139.7 with HTTP; Fri, 17 Oct 2008 05:11:31 -0700 (PDT)
Message-ID: <5c5e5c350810170511me79ab00ja268198b6d695dfb@mail.gmail.com>
Date: Fri, 17 Oct 2008 14:11:31 +0200
From: "Elena of Valhalla" <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: git repository [was:Re: Adding support for our]
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
X-List-Received-Date: Fri, 17 Oct 2008 12:11:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Oct 17, 2008 at 1:19 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> [...]
> 2) the better way: expose a git repo somewhere with your changes and
> ask for review.

is there a guide on the proper way to do this? I don't seem to have
noticed it in the git phrasebook.

I've been able to find some informations on exposing a "standalone"
git repo, but with "local" edits of someone else's repo I'm lost

thanks

-- 
Elena of Valhalla

homepage: http://www.trueelena.org
email: elena.valhalla@gmail.com


