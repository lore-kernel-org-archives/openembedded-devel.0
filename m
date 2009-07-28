Received: from [209.85.218.224] (helo=mail-bw0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ajaiwork@gmail.com>) id 1MVmxe-0005iU-DT
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jul 2009 15:43:22 +0200
Received: by bwz24 with SMTP id 24so16906bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2009 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=LzomKmOcJ86ZaUvuw+TBcJPY9btqYTxJYt7IiYPFqgk=;
	b=Ez1ftuERos8EVDxvJX7njmchzVR/kuAEl0EXcDvqAZk9rtwfddxb9hTJsloJxcW726
	vjCA0YiIyMYtW5c0l8dVWPOdkYP+mP9SjTp+i4LUz7+31DHV8ySnjVxcC5AM1L1ghjqO
	2iW1aZtVG3eSAWmDdsmmM+XKcar8LkyEntGTk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=lcrGa0ft718eLhWigF5cm26+IHv2UkfcwC5BrzmaFR890ptyGOnJB+LoUY82WszYXH
	cMYGgw+OFHkZN+Y9jmhJdTvTwu2fV53LYkbOMYAXEIBpfFy4WYtYSWD2JLx7j1IV6/+o
	9n+IFBEg6fgoTvq8vOH3u6j9cPDFTXaTMqayU=
MIME-Version: 1.0
Received: by 10.204.55.15 with SMTP id s15mr3875521bkg.53.1248787712929; Tue, 
	28 Jul 2009 06:28:32 -0700 (PDT)
Date: Tue, 28 Jul 2009 09:28:32 -0400
Message-ID: <ffb1d4130907280628q3e8138fx349a0e780dc15c85@mail.gmail.com>
From: anku jain <ajaiwork@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: pjsip in angstrom distribution
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
X-List-Received-Date: Tue, 28 Jul 2009 13:43:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

hello there
I have been trying to get a sip library known as pjsip into an angstrom
based base-image. I have had some luck with getting an ipk file created
however my colleague and I would like get hold of a ".so" library file that
would enable us to cross compile our code, till now we haven't been able to
do that. Is there anyone who has worked on and could help me resolve this
problem.

Thank you

