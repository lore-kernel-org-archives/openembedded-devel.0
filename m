Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <npavel@mini-box.com>) id 1SMd4l-0008FL-8Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 12:34:27 +0200
Received: by pbcum15 with SMTP id um15so4143465pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2012 03:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=TeHdusIaDIPqd6WPXQARfVItTnzy+LPRdseNSgKhO3s=;
	b=jlN5gc9uG5fkcU2sRg5rEp2Tbdy26+76iCDDTsE069qO5W4sTeE441/1smjqmJ0C1w
	ATCusjWiZ1xWGvqc2fTPUVsVbxC2taiS2SRMl7zuwlkHVAMQH6JRNGyeUJBJPfBrIraf
	fzovtFhLkocHJ7JyYEuBoPNnKhb/F1uhTGQKsVyekr2gAzbMIBmlEHbzH/nSh6JuVtBg
	P8M/SaS99UCL9rej6zFbdSG5aMyqQzjdgxjQJgqj2yK1YAUrpz2VQYX8vdf79zk+khOS
	sE5rmdRB5PXvhQwAns6AodQ+NljYhVwYB6ktkDiWwPg/UbsbGq3lPvshDZ+WIgKwq/Ae
	PXJA==
MIME-Version: 1.0
Received: by 10.68.221.66 with SMTP id qc2mr2963015pbc.131.1335263091703; Tue,
	24 Apr 2012 03:24:51 -0700 (PDT)
Received: by 10.68.229.202 with HTTP; Tue, 24 Apr 2012 03:24:51 -0700 (PDT)
Date: Tue, 24 Apr 2012 13:24:51 +0300
Message-ID: <CAL9MRr=VckWCzbq=+t9SJZ9CiLfPcAp4CrYNihUS1cOYc0-NFA@mail.gmail.com>
From: Nicu Pavel <npavel@mini-box.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnas8SVQCeMAmj1JWoxDOYRejLynoM75gxQj2yyWOeX6KLnGa2wCVR7ehjZRogbRE6mXOxi
Subject: Adding a board support layer.
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
X-List-Received-Date: Tue, 24 Apr 2012 10:34:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

What's the proper way of adding a new board support layer ? Should I
just add a meta-picosam9 with our kernel recipes and board
configuration and submit a patch ?

Thanks,
Nicu Pavel


