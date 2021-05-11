module PeopleHelper
    def loan_status(person_id)
        loan = Loan.where(:person_id => person_id).first
        total_amount = Delivery.where(:loan_id => loan.id).sum(:amount) unless loan.nil?

        if loan.nil?
            "table-danger"
        elsif loan.amount > total_amount
            "table-warning"
        elsif loan.amount = total_amount
            "table-success"
        end
    end

    def person_loan(person_id)
        if Loan.where(:person_id => person_id).first.nil?
            "No"
        else
            "Sí"
        end
    end

    def loan_amount(person_id)
        loan = Loan.where(:person_id => person_id).first

        if loan.nil?
            0
        else
            Delivery.where(:loan_id => loan.id).sum(:amount) 
        end
    end

    def remaining_deliveries(person_id)
        loan = Loan.where(:person_id => person_id).first

        if loan.nil?
            0
        else
            loan.amount - Delivery.where(:loan_id => loan.id).sum(:amount) 
        end
    end

end
